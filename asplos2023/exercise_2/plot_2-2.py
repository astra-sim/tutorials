import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os


def main():
    # read tutorial_result.csv
    df = pd.read_csv('./result_2-2/tutorial_result.csv')

    # adjust dataframe
    del df['TotalTime(us)']
    del df['TotalMessageSize(MB)']
    df = df.rename(columns={
        "ComputeTime(us)": "Compute Time",
        "ExposedCommunicationTime(us)": "Exposed Communication Time"
    })
    df.reset_index(drop=True, inplace=True)

    # create a plot
    sns.set(font_scale=1.5, rc={'font.weight': 'bold'})
    sns.set_style(style='ticks')
    fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(8, 3))

    # plot the data
    df.plot.barh(stacked=True, ax=ax, legend=True, x='Name')
    plt.gca().invert_yaxis()
    ax.set_xlabel("Time [µs]", fontweight='bold')
    ax.set_ylabel("System", fontweight='bold')

    # move legend out of the ax
    ax.legend(loc='upper center', bbox_to_anchor=(0.35, -0.4), ncol=5)
    plt.tight_layout()
    plt.subplots_adjust(bottom=0.4)

    # save the plot
    fig.savefig(os.path.join('./result_2-2', 'plot_2-2.png'))
    fig.savefig(os.path.join('./result_2-2', 'plot_2-2.pdf'))
    fig.clf()
    plt.close(fig=fig)

    # show the log
    print("Result saved at ./result_2-2")


if __name__ == '__main__':
    main()
