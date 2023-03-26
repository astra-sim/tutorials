import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os


def main():
    # read tutorial_result.csv
    df = pd.read_csv('./result_1-3/tutorial_result.csv')

    # create a plot
    sns.set(font_scale=1.5, rc={'font.weight': 'bold'})
    sns.set_style(style='ticks')
    fig, ax = plt.subplots(nrows=1, ncols=1, figsize=(6, 6))

    # plot the data
    sns.lineplot(x='Name', y='TotalTime(us)', data=df, ax=ax,
                 marker='o', markersize=10, linewidth=3)
    ax.set_xlabel("All-Reduce Size [MB]", fontweight='bold')
    ax.set_ylabel("Total Time [µs]", fontweight='bold')

    # save the plot
    fig.tight_layout()
    fig.savefig(os.path.join('./result_1-3', 'plot_1-3.png'))
    fig.savefig(os.path.join('./result_1-3', 'plot_1-3.pdf'))
    fig.clf()
    plt.close(fig=fig)

    # show the log
    print("Result saved at ./result_1-3")


if __name__ == '__main__':
    main()
