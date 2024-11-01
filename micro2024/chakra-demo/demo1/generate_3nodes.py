import os

from chakra.third_party.utils.protolib import encodeMessage as encode_message
from chakra.et_def.et_def_pb2 import (
    Node as ChakraNode,
    BoolList,
    GlobalMetadata,
    AttributeProto as ChakraAttr,
    COMP_NODE,
    COMM_COLL_NODE,
    ALL_REDUCE,
    ALL_GATHER
)


def main() -> None:
    # create directories
    if not os.path.exists("./3nodes"):
        os.makedirs("./3nodes")
    

    # metadata
    npus_count = 8  # 8 NPUs
    coll_size = 1_048_576  # 1 MB

    for npu_id in range(npus_count):
        output_filename = f"3nodes/3nodes.{npu_id}.et"
        with open(output_filename, "wb") as et:
            # Chakra Metadata
            encode_message(et, GlobalMetadata(version="0.0.4"))

            # Node 1
            node1 = ChakraNode()
            node1.id = 1
            node1.name = "All-Reduce-1MB"
            node1.type = COMM_COLL_NODE
            node1.attr.append(ChakraAttr(name="is_cpu_op", bool_val=False))
            node1.attr.append(ChakraAttr(name="comm_type", int64_val=ALL_REDUCE))
            node1.attr.append(ChakraAttr(name="comm_size", uint64_val=coll_size))
            node1.attr.append(ChakraAttr(name="involved_dim", bool_list=BoolList(values=[True])))
            encode_message(et, node1)

            # Node 2
            node2 = ChakraNode()
            node2.id = 2
            node2.name = "All-Gather-2MB"
            node2.type = COMM_COLL_NODE
            node2.attr.append(ChakraAttr(name="is_cpu_op", bool_val=False))
            node2.attr.append(ChakraAttr(name="comm_type", int64_val=ALL_GATHER))
            node2.attr.append(ChakraAttr(name="comm_size", uint64_val=coll_size * 2))
            node2.attr.append(ChakraAttr(name="involved_dim", bool_list=BoolList(values=[True])))
            node2.data_deps.append(node1.id)  # dependency on Node 1
            encode_message(et, node2)

            # Node 3
            node3 = ChakraNode()
            node3.id = 3
            node3.name = "Compute-50us"
            node3.type = COMP_NODE
            node3.duration_micros = 50
            node3.attr.append(ChakraAttr(name="is_cpu_op", bool_val=False))
            node3.data_deps.append(node1.id)  # dependency on Node 1
            encode_message(et, node3)

if __name__ == "__main__":
    main()
