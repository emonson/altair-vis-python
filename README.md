## Visualizing data in Python with Altair

This is a introductory-level workshop given through Duke University's 
[Center for Data and Visualization Sciences](https://library.duke.edu/data) on how to use
[Altair](https://altair-viz.github.io/) to visualize and explore data within 
[JupyterLab](https://jupyterlab.readthedocs.io/en/stable/).

### Installs

**I recommend using the [Anaconda Python distribution](https://www.anaconda.com/distribution/) 
as an easy way to get Python, JupyterLab, and Altair.**

The numbered lessons have been updated to use Altair 5, which has some 
[new features and syntax](https://altair-viz.github.io/releases/changes.html) 
not present in the workshop videos below. 

I have also started using [VegaFusion](https://vegafusion.io/) 
to get around the MaxRowsError when visualizing data with more than 5000 rows, 
and the speed issues associated with having Altair
(really Vega-Lite and JavaScript in the background) do your data aggregation, filtering, and transformations.
This doesn't come with Anaconda, so you'll need to install the modules and associated Jupyter
extensions with:

```
pip install "vegafusion[embed]"
pip install "vegafusion-jupyter[embed]"
```

### Workshop videos

There is a [recording of a workshop from Fall 2021](https://warpwire.duke.edu/w/-doGAA/),
and you can download [a PDF of the slides](https://bit.ly/AltairFall2021) from the lecture portion.

I also have a 
recording of a previous workshop called 
[Pandas 101 – Intro to Tabular Data in Python and JupyterLab](https://warpwire.duke.edu/w/4-MGAA/), 
which might be good to watch before this one if you're not familiar with JupyterLab 
or manipulating tabular data in Python with [Pandas](https://pandas.pydata.org/).

Neither workshop teaches the basics of the Python programming language, and it's probably
helpful to have seen some Python before this if you're going to make any sense out of the 
material. But, you don't have to be very advanced to learn something from these videos!