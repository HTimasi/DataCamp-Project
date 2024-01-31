{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "da9f1737",
   "metadata": {
    "_cell_guid": "b1076dfc-b9ad-4769-8c92-a6c4dae69d19",
    "_uuid": "8f2839f25d086af736a60e9eeb907d3b93b6e0e5",
    "execution": {
     "iopub.execute_input": "2024-01-31T09:14:27.186617Z",
     "iopub.status.busy": "2024-01-31T09:14:27.183949Z",
     "iopub.status.idle": "2024-01-31T09:14:27.312942Z",
     "shell.execute_reply": "2024-01-31T09:14:27.310815Z"
    },
    "papermill": {
     "duration": 0.145475,
     "end_time": "2024-01-31T09:14:27.315856",
     "exception": false,
     "start_time": "2024-01-31T09:14:27.170381",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Case Study: How Does a Bike-Share Navigate Speed"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b36edd84",
   "metadata": {
    "papermill": {
     "duration": 0.010215,
     "end_time": "2024-01-31T09:14:27.336510",
     "exception": false,
     "start_time": "2024-01-31T09:14:27.326295",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "---\n",
    "### title: \"How Does a Bike-Share Navigate Speedy Success\"\n",
    "### author: \"Hossein Timasi\"\n",
    "### date: \"2024-01-29\"\n",
    "### data-set: \"2023, 12 month of Cyclistic trip in Chicago city\" , Licensed by divvy.com\n",
    "\n",
    "---\n",
    "Hi, in last few months, I've been working on the Google Data Analytics Professional Certificate.\n",
    "Here I will share what I have done as a final capstone. In this case study, I will be analyzing a public dataset a bike-share company in Chicago. I will be using the R programming language for data analysis and Tableau for visualizations.\n",
    "\n",
    "## About the company\n",
    "\n",
    "In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geo tracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.\n",
    "Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.\n",
    "\n",
    "## the following data analysis steps will be followed:\n",
    "\n",
    "* Ask, Prepare, Process, Analyze, Share, Act.\n",
    "\n",
    "## Ask\n",
    "\n",
    "The questions that need to be answered are:\n",
    "1- How do annual members and casual riders use Cyclistic bikes differently?\n",
    "2- Why would casual riders buy Cyclistic annual memberships?\n",
    "3- How can Cyclistic use digital media to influence casual riders to become members?\n",
    "\n",
    "## Prepare\n",
    "\n",
    "The dataset follows the ROCCC Analysis as described below:\n",
    "Reliable - yes, not biased\n",
    "Original - yes, can locate the original public data\n",
    "Comprehensive - yes, not missing important information\n",
    "Current - yes, updated monthly\n",
    "Cited - yes\n",
    "I will be using the public dataset located [here](https://divvy-tripdata.s3.amazonaws.com/index.html). The data has been made available by Motivate International Inc. under this [license](https://divvybikes.com/data-license-agreement). \n",
    "Key Tasks Followed:\n",
    "\n",
    "1- Downloaded data and copies have been stored on the computer.\n",
    "2- I have downloaded the data for April 21-March 22 Period.\n",
    "3- The data is in CSV (comma-separated values) format, and there are a total of 13 columns."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "dcbc2bed",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:14:27.400132Z",
     "iopub.status.busy": "2024-01-31T09:14:27.359403Z",
     "iopub.status.idle": "2024-01-31T09:15:17.628010Z",
     "shell.execute_reply": "2024-01-31T09:15:17.625946Z"
    },
    "papermill": {
     "duration": 50.284634,
     "end_time": "2024-01-31T09:15:17.631602",
     "exception": false,
     "start_time": "2024-01-31T09:14:27.346968",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "#Installing and loading required packages\n",
    "\n",
    "install.packages(\"tidyverse\")\n",
    "install.packages(\"lubridate\")\n",
    "install.packages(\"janitor\")\n",
    "library(tidyverse)\n",
    "library(lubridate)\n",
    "library(janitor)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "660cec08",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:15:17.659981Z",
     "iopub.status.busy": "2024-01-31T09:15:17.657587Z",
     "iopub.status.idle": "2024-01-31T09:17:18.495754Z",
     "shell.execute_reply": "2024-01-31T09:17:18.493683Z"
    },
    "papermill": {
     "duration": 120.855631,
     "end_time": "2024-01-31T09:17:18.499583",
     "exception": false,
     "start_time": "2024-01-31T09:15:17.643952",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Importing data to data-frame in R:\n",
    "df_1 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202301-divvy-tripdata.csv\")\n",
    "df_2 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202302-divvy-tripdata.csv\")\n",
    "df_3 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202303-divvy-tripdata.csv\")\n",
    "df_4 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202304-divvy-tripdata.csv\")\n",
    "df_5 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202305-divvy-tripdata.csv\")\n",
    "df_6 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202306-divvy-tripdata.csv\")\n",
    "df_7 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202307-divvy-tripdata.csv\")\n",
    "df_8 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202308-divvy-tripdata.csv\")\n",
    "df_9 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202309-divvy-tripdata.csv\")\n",
    "df_10 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202310-divvy-tripdata.csv\")\n",
    "df_11 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202311-divvy-tripdata.csv\")\n",
    "df_12 <- read.csv(\"/kaggle/input/divvy-bike-jan-to-dec-2023/202312-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "8262ed1b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:17:18.530460Z",
     "iopub.status.busy": "2024-01-31T09:17:18.528592Z",
     "iopub.status.idle": "2024-01-31T09:18:00.056071Z",
     "shell.execute_reply": "2024-01-31T09:18:00.053959Z"
    },
    "papermill": {
     "duration": 41.54607,
     "end_time": "2024-01-31T09:18:00.060185",
     "exception": false,
     "start_time": "2024-01-31T09:17:18.514115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Merging data into a single data frame:\n",
    "tripdata_2023 <- rbind(df_1, df_2, df_3, df_4, df_5, df_6, df_7, df_8, df_9, df_10, df_11, df_12)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "65e97396",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:18:00.087700Z",
     "iopub.status.busy": "2024-01-31T09:18:00.085900Z",
     "iopub.status.idle": "2024-01-31T09:18:00.132082Z",
     "shell.execute_reply": "2024-01-31T09:18:00.129455Z"
    },
    "papermill": {
     "duration": 0.062979,
     "end_time": "2024-01-31T09:18:00.135440",
     "exception": false,
     "start_time": "2024-01-31T09:18:00.072461",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t5719877 obs. of  13 variables:\n",
      " $ ride_id           : chr  \"F96D5A74A3E41399\" \"13CB7EB698CEDB88\" \"BD88A2E670661CE5\" \"C90792D034FED968\" ...\n",
      " $ rideable_type     : chr  \"electric_bike\" \"classic_bike\" \"electric_bike\" \"classic_bike\" ...\n",
      " $ started_at        : chr  \"2023-01-21 20:05:42\" \"2023-01-10 15:37:36\" \"2023-01-02 07:51:57\" \"2023-01-22 10:52:58\" ...\n",
      " $ ended_at          : chr  \"2023-01-21 20:16:33\" \"2023-01-10 15:46:05\" \"2023-01-02 08:05:11\" \"2023-01-22 11:01:44\" ...\n",
      " $ start_station_name: chr  \"Lincoln Ave & Fullerton Ave\" \"Kimbark Ave & 53rd St\" \"Western Ave & Lunt Ave\" \"Kimbark Ave & 53rd St\" ...\n",
      " $ start_station_id  : chr  \"TA1309000058\" \"TA1309000037\" \"RP-005\" \"TA1309000037\" ...\n",
      " $ end_station_name  : chr  \"Hampden Ct & Diversey Ave\" \"Greenwood Ave & 47th St\" \"Valli Produce - Evanston Plaza\" \"Greenwood Ave & 47th St\" ...\n",
      " $ end_station_id    : chr  \"202480.0\" \"TA1308000002\" \"599\" \"TA1308000002\" ...\n",
      " $ start_lat         : num  41.9 41.8 42 41.8 41.8 ...\n",
      " $ start_lng         : num  -87.6 -87.6 -87.7 -87.6 -87.6 ...\n",
      " $ end_lat           : num  41.9 41.8 42 41.8 41.8 ...\n",
      " $ end_lng           : num  -87.6 -87.6 -87.7 -87.6 -87.6 ...\n",
      " $ member_casual     : chr  \"member\" \"member\" \"casual\" \"member\" ...\n"
     ]
    }
   ],
   "source": [
    "#Checking data:\n",
    "str(tripdata_2023)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "6b0ad1ff",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:18:00.161561Z",
     "iopub.status.busy": "2024-01-31T09:18:00.159792Z",
     "iopub.status.idle": "2024-01-31T09:18:00.206682Z",
     "shell.execute_reply": "2024-01-31T09:18:00.203922Z"
    },
    "papermill": {
     "duration": 0.063847,
     "end_time": "2024-01-31T09:18:00.210252",
     "exception": false,
     "start_time": "2024-01-31T09:18:00.146405",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 13</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>F96D5A74A3E41399</td><td>electric_bike</td><td>2023-01-21 20:05:42</td><td>2023-01-21 20:16:33</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Fullerton Ave  </span></td><td>TA1309000058</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92407</td><td>-87.64628</td><td>41.93000</td><td>-87.64000</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>13CB7EB698CEDB88</td><td>classic_bike </td><td>2023-01-10 15:37:36</td><td>2023-01-10 15:46:05</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>BD88A2E670661CE5</td><td>electric_bike</td><td>2023-01-02 07:51:57</td><td>2023-01-02 08:05:11</td><td><span style=white-space:pre-wrap>Western Ave &amp; Lunt Ave       </span></td><td><span style=white-space:pre-wrap>RP-005      </span></td><td>Valli Produce - Evanston Plaza</td><td><span style=white-space:pre-wrap>599         </span></td><td>42.00857</td><td>-87.69048</td><td>42.03974</td><td>-87.69941</td><td>casual</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>C90792D034FED968</td><td>classic_bike </td><td>2023-01-22 10:52:58</td><td>2023-01-22 11:01:44</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>3397017529188E8A</td><td>classic_bike </td><td>2023-01-12 13:58:01</td><td>2023-01-12 14:13:20</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>58E68156DAE3E311</td><td>electric_bike</td><td>2023-01-31 07:18:03</td><td>2023-01-31 07:21:16</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td>TA1309000019</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92607</td><td>-87.63886</td><td>41.93000</td><td>-87.64000</td><td>member</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 13\n",
       "\\begin{tabular}{r|lllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & F96D5A74A3E41399 & electric\\_bike & 2023-01-21 20:05:42 & 2023-01-21 20:16:33 & Lincoln Ave \\& Fullerton Ave   & TA1309000058 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92407 & -87.64628 & 41.93000 & -87.64000 & member\\\\\n",
       "\t2 & 13CB7EB698CEDB88 & classic\\_bike  & 2023-01-10 15:37:36 & 2023-01-10 15:46:05 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member\\\\\n",
       "\t3 & BD88A2E670661CE5 & electric\\_bike & 2023-01-02 07:51:57 & 2023-01-02 08:05:11 & Western Ave \\& Lunt Ave        & RP-005       & Valli Produce - Evanston Plaza & 599          & 42.00857 & -87.69048 & 42.03974 & -87.69941 & casual\\\\\n",
       "\t4 & C90792D034FED968 & classic\\_bike  & 2023-01-22 10:52:58 & 2023-01-22 11:01:44 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member\\\\\n",
       "\t5 & 3397017529188E8A & classic\\_bike  & 2023-01-12 13:58:01 & 2023-01-12 14:13:20 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member\\\\\n",
       "\t6 & 58E68156DAE3E311 & electric\\_bike & 2023-01-31 07:18:03 & 2023-01-31 07:21:16 & Lakeview Ave \\& Fullerton Pkwy & TA1309000019 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92607 & -87.63886 & 41.93000 & -87.64000 & member\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 13\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | F96D5A74A3E41399 | electric_bike | 2023-01-21 20:05:42 | 2023-01-21 20:16:33 | Lincoln Ave &amp; Fullerton Ave   | TA1309000058 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92407 | -87.64628 | 41.93000 | -87.64000 | member |\n",
       "| 2 | 13CB7EB698CEDB88 | classic_bike  | 2023-01-10 15:37:36 | 2023-01-10 15:46:05 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member |\n",
       "| 3 | BD88A2E670661CE5 | electric_bike | 2023-01-02 07:51:57 | 2023-01-02 08:05:11 | Western Ave &amp; Lunt Ave        | RP-005       | Valli Produce - Evanston Plaza | 599          | 42.00857 | -87.69048 | 42.03974 | -87.69941 | casual |\n",
       "| 4 | C90792D034FED968 | classic_bike  | 2023-01-22 10:52:58 | 2023-01-22 11:01:44 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member |\n",
       "| 5 | 3397017529188E8A | classic_bike  | 2023-01-12 13:58:01 | 2023-01-12 14:13:20 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member |\n",
       "| 6 | 58E68156DAE3E311 | electric_bike | 2023-01-31 07:18:03 | 2023-01-31 07:21:16 | Lakeview Ave &amp; Fullerton Pkwy | TA1309000019 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92607 | -87.63886 | 41.93000 | -87.64000 | member |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 F96D5A74A3E41399 electric_bike 2023-01-21 20:05:42 2023-01-21 20:16:33\n",
       "2 13CB7EB698CEDB88 classic_bike  2023-01-10 15:37:36 2023-01-10 15:46:05\n",
       "3 BD88A2E670661CE5 electric_bike 2023-01-02 07:51:57 2023-01-02 08:05:11\n",
       "4 C90792D034FED968 classic_bike  2023-01-22 10:52:58 2023-01-22 11:01:44\n",
       "5 3397017529188E8A classic_bike  2023-01-12 13:58:01 2023-01-12 14:13:20\n",
       "6 58E68156DAE3E311 electric_bike 2023-01-31 07:18:03 2023-01-31 07:21:16\n",
       "  start_station_name            start_station_id end_station_name              \n",
       "1 Lincoln Ave & Fullerton Ave   TA1309000058     Hampden Ct & Diversey Ave     \n",
       "2 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "3 Western Ave & Lunt Ave        RP-005           Valli Produce - Evanston Plaza\n",
       "4 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "5 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "6 Lakeview Ave & Fullerton Pkwy TA1309000019     Hampden Ct & Diversey Ave     \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 202480.0       41.92407  -87.64628 41.93000 -87.64000 member       \n",
       "2 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "3 599            42.00857  -87.69048 42.03974 -87.69941 casual       \n",
       "4 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "5 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "6 202480.0       41.92607  -87.63886 41.93000 -87.64000 member       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#printing the first 6 rows to see data scheme:\n",
    "head(tripdata_2023)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "5568d6b6",
   "metadata": {
    "papermill": {
     "duration": 0.012234,
     "end_time": "2024-01-31T09:18:00.234268",
     "exception": false,
     "start_time": "2024-01-31T09:18:00.222034",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Process\n",
    "### Data Cleaning and Preparing\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "38ff9e09",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:18:00.262381Z",
     "iopub.status.busy": "2024-01-31T09:18:00.260591Z",
     "iopub.status.idle": "2024-01-31T09:18:14.411764Z",
     "shell.execute_reply": "2024-01-31T09:18:14.409089Z"
    },
    "papermill": {
     "duration": 14.170594,
     "end_time": "2024-01-31T09:18:14.416281",
     "exception": false,
     "start_time": "2024-01-31T09:18:00.245687",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5719877</li><li>13</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5719877\n",
       "\\item 13\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5719877\n",
       "2. 13\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5719877      13"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Using janitor to check and remove the empty columns and rows\n",
    "\n",
    "tripdata_2023 <- janitor::remove_empty(dat = tripdata_2023, which = c(\"rows\", \"cols\"))\n",
    "dim(tripdata_2023)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "ae05f194",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:18:14.444398Z",
     "iopub.status.busy": "2024-01-31T09:18:14.442703Z",
     "iopub.status.idle": "2024-01-31T09:18:27.704169Z",
     "shell.execute_reply": "2024-01-31T09:18:27.701297Z"
    },
    "papermill": {
     "duration": 13.279925,
     "end_time": "2024-01-31T09:18:27.708441",
     "exception": false,
     "start_time": "2024-01-31T09:18:14.428516",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 16</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>F96D5A74A3E41399</td><td>electric_bike</td><td>2023-01-21 20:05:42</td><td>2023-01-21 20:16:33</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Fullerton Ave  </span></td><td>TA1309000058</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92407</td><td>-87.64628</td><td>41.93000</td><td>-87.64000</td><td>member</td><td>2023-01-21</td><td>01</td><td>Saturday</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>13CB7EB698CEDB88</td><td>classic_bike </td><td>2023-01-10 15:37:36</td><td>2023-01-10 15:46:05</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-10</td><td>01</td><td>Tuesday </td></tr>\n",
       "\t<tr><th scope=row>3</th><td>BD88A2E670661CE5</td><td>electric_bike</td><td>2023-01-02 07:51:57</td><td>2023-01-02 08:05:11</td><td><span style=white-space:pre-wrap>Western Ave &amp; Lunt Ave       </span></td><td><span style=white-space:pre-wrap>RP-005      </span></td><td>Valli Produce - Evanston Plaza</td><td><span style=white-space:pre-wrap>599         </span></td><td>42.00857</td><td>-87.69048</td><td>42.03974</td><td>-87.69941</td><td>casual</td><td>2023-01-02</td><td>01</td><td><span style=white-space:pre-wrap>Monday  </span></td></tr>\n",
       "\t<tr><th scope=row>4</th><td>C90792D034FED968</td><td>classic_bike </td><td>2023-01-22 10:52:58</td><td>2023-01-22 11:01:44</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-22</td><td>01</td><td><span style=white-space:pre-wrap>Sunday  </span></td></tr>\n",
       "\t<tr><th scope=row>5</th><td>3397017529188E8A</td><td>classic_bike </td><td>2023-01-12 13:58:01</td><td>2023-01-12 14:13:20</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-12</td><td>01</td><td>Thursday</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>58E68156DAE3E311</td><td>electric_bike</td><td>2023-01-31 07:18:03</td><td>2023-01-31 07:21:16</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td>TA1309000019</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92607</td><td>-87.63886</td><td>41.93000</td><td>-87.64000</td><td>member</td><td>2023-01-31</td><td>01</td><td>Tuesday </td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 16\n",
       "\\begin{tabular}{r|llllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & date & month & day\\_of\\_week\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <date> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\t1 & F96D5A74A3E41399 & electric\\_bike & 2023-01-21 20:05:42 & 2023-01-21 20:16:33 & Lincoln Ave \\& Fullerton Ave   & TA1309000058 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92407 & -87.64628 & 41.93000 & -87.64000 & member & 2023-01-21 & 01 & Saturday\\\\\n",
       "\t2 & 13CB7EB698CEDB88 & classic\\_bike  & 2023-01-10 15:37:36 & 2023-01-10 15:46:05 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-10 & 01 & Tuesday \\\\\n",
       "\t3 & BD88A2E670661CE5 & electric\\_bike & 2023-01-02 07:51:57 & 2023-01-02 08:05:11 & Western Ave \\& Lunt Ave        & RP-005       & Valli Produce - Evanston Plaza & 599          & 42.00857 & -87.69048 & 42.03974 & -87.69941 & casual & 2023-01-02 & 01 & Monday  \\\\\n",
       "\t4 & C90792D034FED968 & classic\\_bike  & 2023-01-22 10:52:58 & 2023-01-22 11:01:44 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-22 & 01 & Sunday  \\\\\n",
       "\t5 & 3397017529188E8A & classic\\_bike  & 2023-01-12 13:58:01 & 2023-01-12 14:13:20 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-12 & 01 & Thursday\\\\\n",
       "\t6 & 58E68156DAE3E311 & electric\\_bike & 2023-01-31 07:18:03 & 2023-01-31 07:21:16 & Lakeview Ave \\& Fullerton Pkwy & TA1309000019 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92607 & -87.63886 & 41.93000 & -87.64000 & member & 2023-01-31 & 01 & Tuesday \\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 16\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | day_of_week &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | F96D5A74A3E41399 | electric_bike | 2023-01-21 20:05:42 | 2023-01-21 20:16:33 | Lincoln Ave &amp; Fullerton Ave   | TA1309000058 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92407 | -87.64628 | 41.93000 | -87.64000 | member | 2023-01-21 | 01 | Saturday |\n",
       "| 2 | 13CB7EB698CEDB88 | classic_bike  | 2023-01-10 15:37:36 | 2023-01-10 15:46:05 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-10 | 01 | Tuesday  |\n",
       "| 3 | BD88A2E670661CE5 | electric_bike | 2023-01-02 07:51:57 | 2023-01-02 08:05:11 | Western Ave &amp; Lunt Ave        | RP-005       | Valli Produce - Evanston Plaza | 599          | 42.00857 | -87.69048 | 42.03974 | -87.69941 | casual | 2023-01-02 | 01 | Monday   |\n",
       "| 4 | C90792D034FED968 | classic_bike  | 2023-01-22 10:52:58 | 2023-01-22 11:01:44 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-22 | 01 | Sunday   |\n",
       "| 5 | 3397017529188E8A | classic_bike  | 2023-01-12 13:58:01 | 2023-01-12 14:13:20 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-12 | 01 | Thursday |\n",
       "| 6 | 58E68156DAE3E311 | electric_bike | 2023-01-31 07:18:03 | 2023-01-31 07:21:16 | Lakeview Ave &amp; Fullerton Pkwy | TA1309000019 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92607 | -87.63886 | 41.93000 | -87.64000 | member | 2023-01-31 | 01 | Tuesday  |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 F96D5A74A3E41399 electric_bike 2023-01-21 20:05:42 2023-01-21 20:16:33\n",
       "2 13CB7EB698CEDB88 classic_bike  2023-01-10 15:37:36 2023-01-10 15:46:05\n",
       "3 BD88A2E670661CE5 electric_bike 2023-01-02 07:51:57 2023-01-02 08:05:11\n",
       "4 C90792D034FED968 classic_bike  2023-01-22 10:52:58 2023-01-22 11:01:44\n",
       "5 3397017529188E8A classic_bike  2023-01-12 13:58:01 2023-01-12 14:13:20\n",
       "6 58E68156DAE3E311 electric_bike 2023-01-31 07:18:03 2023-01-31 07:21:16\n",
       "  start_station_name            start_station_id end_station_name              \n",
       "1 Lincoln Ave & Fullerton Ave   TA1309000058     Hampden Ct & Diversey Ave     \n",
       "2 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "3 Western Ave & Lunt Ave        RP-005           Valli Produce - Evanston Plaza\n",
       "4 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "5 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "6 Lakeview Ave & Fullerton Pkwy TA1309000019     Hampden Ct & Diversey Ave     \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 202480.0       41.92407  -87.64628 41.93000 -87.64000 member       \n",
       "2 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "3 599            42.00857  -87.69048 42.03974 -87.69941 casual       \n",
       "4 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "5 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "6 202480.0       41.92607  -87.63886 41.93000 -87.64000 member       \n",
       "  date       month day_of_week\n",
       "1 2023-01-21 01    Saturday   \n",
       "2 2023-01-10 01    Tuesday    \n",
       "3 2023-01-02 01    Monday     \n",
       "4 2023-01-22 01    Sunday     \n",
       "5 2023-01-12 01    Thursday   \n",
       "6 2023-01-31 01    Tuesday    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Creating \"date\" column as date and\n",
    "# month column to indicate the month in number format\n",
    "# \"day_of_week\" column.\n",
    "\n",
    "tripdata_2023$date <- as.Date(tripdata_2023$started_at)\n",
    "tripdata_2023$month <- format(as.Date(tripdata_2023$date), \"%m\")\n",
    "tripdata_2023$day_of_week <- format(as.Date(tripdata_2023$date), \"%A\")\n",
    "head(tripdata_2023)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a6eaee7a",
   "metadata": {
    "papermill": {
     "duration": 0.012867,
     "end_time": "2024-01-31T09:18:27.733705",
     "exception": false,
     "start_time": "2024-01-31T09:18:27.720838",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "creating a column called \"ride_length\". Calculate the length of each ride by subtracting the column \"started_at\" from the column \"ended_at\""
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "2c60aaaa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:18:27.763388Z",
     "iopub.status.busy": "2024-01-31T09:18:27.761658Z",
     "iopub.status.idle": "2024-01-31T09:19:12.448347Z",
     "shell.execute_reply": "2024-01-31T09:19:12.446397Z"
    },
    "papermill": {
     "duration": 44.717979,
     "end_time": "2024-01-31T09:19:12.464276",
     "exception": false,
     "start_time": "2024-01-31T09:18:27.746297",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>day_of_week</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>F96D5A74A3E41399</td><td>electric_bike</td><td>2023-01-21 20:05:42</td><td>2023-01-21 20:16:33</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Fullerton Ave  </span></td><td>TA1309000058</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92407</td><td>-87.64628</td><td>41.93000</td><td>-87.64000</td><td>member</td><td>2023-01-21</td><td>01</td><td>Saturday</td><td>651</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>13CB7EB698CEDB88</td><td>classic_bike </td><td>2023-01-10 15:37:36</td><td>2023-01-10 15:46:05</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-10</td><td>01</td><td>Tuesday </td><td>509</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>BD88A2E670661CE5</td><td>electric_bike</td><td>2023-01-02 07:51:57</td><td>2023-01-02 08:05:11</td><td><span style=white-space:pre-wrap>Western Ave &amp; Lunt Ave       </span></td><td><span style=white-space:pre-wrap>RP-005      </span></td><td>Valli Produce - Evanston Plaza</td><td><span style=white-space:pre-wrap>599         </span></td><td>42.00857</td><td>-87.69048</td><td>42.03974</td><td>-87.69941</td><td>casual</td><td>2023-01-02</td><td>01</td><td><span style=white-space:pre-wrap>Monday  </span></td><td>794</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>C90792D034FED968</td><td>classic_bike </td><td>2023-01-22 10:52:58</td><td>2023-01-22 11:01:44</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-22</td><td>01</td><td><span style=white-space:pre-wrap>Sunday  </span></td><td>526</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>3397017529188E8A</td><td>classic_bike </td><td>2023-01-12 13:58:01</td><td>2023-01-12 14:13:20</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-12</td><td>01</td><td>Thursday</td><td>919</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>58E68156DAE3E311</td><td>electric_bike</td><td>2023-01-31 07:18:03</td><td>2023-01-31 07:21:16</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td>TA1309000019</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92607</td><td>-87.63886</td><td>41.93000</td><td>-87.64000</td><td>member</td><td>2023-01-31</td><td>01</td><td>Tuesday </td><td>193</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 17\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & date & month & day\\_of\\_week & ride\\_length\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <date> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & F96D5A74A3E41399 & electric\\_bike & 2023-01-21 20:05:42 & 2023-01-21 20:16:33 & Lincoln Ave \\& Fullerton Ave   & TA1309000058 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92407 & -87.64628 & 41.93000 & -87.64000 & member & 2023-01-21 & 01 & Saturday & 651\\\\\n",
       "\t2 & 13CB7EB698CEDB88 & classic\\_bike  & 2023-01-10 15:37:36 & 2023-01-10 15:46:05 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-10 & 01 & Tuesday  & 509\\\\\n",
       "\t3 & BD88A2E670661CE5 & electric\\_bike & 2023-01-02 07:51:57 & 2023-01-02 08:05:11 & Western Ave \\& Lunt Ave        & RP-005       & Valli Produce - Evanston Plaza & 599          & 42.00857 & -87.69048 & 42.03974 & -87.69941 & casual & 2023-01-02 & 01 & Monday   & 794\\\\\n",
       "\t4 & C90792D034FED968 & classic\\_bike  & 2023-01-22 10:52:58 & 2023-01-22 11:01:44 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-22 & 01 & Sunday   & 526\\\\\n",
       "\t5 & 3397017529188E8A & classic\\_bike  & 2023-01-12 13:58:01 & 2023-01-12 14:13:20 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-12 & 01 & Thursday & 919\\\\\n",
       "\t6 & 58E68156DAE3E311 & electric\\_bike & 2023-01-31 07:18:03 & 2023-01-31 07:21:16 & Lakeview Ave \\& Fullerton Pkwy & TA1309000019 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92607 & -87.63886 & 41.93000 & -87.64000 & member & 2023-01-31 & 01 & Tuesday  & 193\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 17\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | day_of_week &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | F96D5A74A3E41399 | electric_bike | 2023-01-21 20:05:42 | 2023-01-21 20:16:33 | Lincoln Ave &amp; Fullerton Ave   | TA1309000058 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92407 | -87.64628 | 41.93000 | -87.64000 | member | 2023-01-21 | 01 | Saturday | 651 |\n",
       "| 2 | 13CB7EB698CEDB88 | classic_bike  | 2023-01-10 15:37:36 | 2023-01-10 15:46:05 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-10 | 01 | Tuesday  | 509 |\n",
       "| 3 | BD88A2E670661CE5 | electric_bike | 2023-01-02 07:51:57 | 2023-01-02 08:05:11 | Western Ave &amp; Lunt Ave        | RP-005       | Valli Produce - Evanston Plaza | 599          | 42.00857 | -87.69048 | 42.03974 | -87.69941 | casual | 2023-01-02 | 01 | Monday   | 794 |\n",
       "| 4 | C90792D034FED968 | classic_bike  | 2023-01-22 10:52:58 | 2023-01-22 11:01:44 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-22 | 01 | Sunday   | 526 |\n",
       "| 5 | 3397017529188E8A | classic_bike  | 2023-01-12 13:58:01 | 2023-01-12 14:13:20 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-12 | 01 | Thursday | 919 |\n",
       "| 6 | 58E68156DAE3E311 | electric_bike | 2023-01-31 07:18:03 | 2023-01-31 07:21:16 | Lakeview Ave &amp; Fullerton Pkwy | TA1309000019 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92607 | -87.63886 | 41.93000 | -87.64000 | member | 2023-01-31 | 01 | Tuesday  | 193 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 F96D5A74A3E41399 electric_bike 2023-01-21 20:05:42 2023-01-21 20:16:33\n",
       "2 13CB7EB698CEDB88 classic_bike  2023-01-10 15:37:36 2023-01-10 15:46:05\n",
       "3 BD88A2E670661CE5 electric_bike 2023-01-02 07:51:57 2023-01-02 08:05:11\n",
       "4 C90792D034FED968 classic_bike  2023-01-22 10:52:58 2023-01-22 11:01:44\n",
       "5 3397017529188E8A classic_bike  2023-01-12 13:58:01 2023-01-12 14:13:20\n",
       "6 58E68156DAE3E311 electric_bike 2023-01-31 07:18:03 2023-01-31 07:21:16\n",
       "  start_station_name            start_station_id end_station_name              \n",
       "1 Lincoln Ave & Fullerton Ave   TA1309000058     Hampden Ct & Diversey Ave     \n",
       "2 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "3 Western Ave & Lunt Ave        RP-005           Valli Produce - Evanston Plaza\n",
       "4 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "5 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "6 Lakeview Ave & Fullerton Pkwy TA1309000019     Hampden Ct & Diversey Ave     \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 202480.0       41.92407  -87.64628 41.93000 -87.64000 member       \n",
       "2 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "3 599            42.00857  -87.69048 42.03974 -87.69941 casual       \n",
       "4 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "5 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "6 202480.0       41.92607  -87.63886 41.93000 -87.64000 member       \n",
       "  date       month day_of_week ride_length\n",
       "1 2023-01-21 01    Saturday    651        \n",
       "2 2023-01-10 01    Tuesday     509        \n",
       "3 2023-01-02 01    Monday      794        \n",
       "4 2023-01-22 01    Sunday      526        \n",
       "5 2023-01-12 01    Thursday    919        \n",
       "6 2023-01-31 01    Tuesday     193        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Creating the \"ride_length\" column:\n",
    "tripdata_2023$ride_length <- difftime(tripdata_2023$ended_at,tripdata_2023$started_at)\n",
    "\n",
    "# Convert \"ride_length\" from Double to numeric so we can run calculations on the data\n",
    "tripdata_2023$ride_length <- as.numeric(as.character(tripdata_2023$ride_length))\n",
    "\n",
    "#print the first 6 rows\n",
    "head(tripdata_2023)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "117ae6cb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:12.493608Z",
     "iopub.status.busy": "2024-01-31T09:19:12.491821Z",
     "iopub.status.idle": "2024-01-31T09:19:12.512255Z",
     "shell.execute_reply": "2024-01-31T09:19:12.509693Z"
    },
    "papermill": {
     "duration": 0.03892,
     "end_time": "2024-01-31T09:19:12.515575",
     "exception": false,
     "start_time": "2024-01-31T09:19:12.476655",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "TRUE"
      ],
      "text/latex": [
       "TRUE"
      ],
      "text/markdown": [
       "TRUE"
      ],
      "text/plain": [
       "[1] TRUE"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check it if it is numeric:\n",
    "is.numeric(tripdata_2023$ride_length)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "58c4ffc4",
   "metadata": {
    "papermill": {
     "duration": 0.013233,
     "end_time": "2024-01-31T09:19:12.541331",
     "exception": false,
     "start_time": "2024-01-31T09:19:12.528098",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Removing the datas which are not correct\n",
    "\n",
    "Remove ride length is less than 0 second and is > 86400 seconds as ride length shouldn't be either negative or more than one day.\n",
    "Also we removing the ride length equals to zero"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "716c1fa9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:12.571909Z",
     "iopub.status.busy": "2024-01-31T09:19:12.570151Z",
     "iopub.status.idle": "2024-01-31T09:19:22.217209Z",
     "shell.execute_reply": "2024-01-31T09:19:22.214585Z"
    },
    "papermill": {
     "duration": 9.666702,
     "end_time": "2024-01-31T09:19:22.221248",
     "exception": false,
     "start_time": "2024-01-31T09:19:12.554546",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5712190</li><li>17</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5712190\n",
       "\\item 17\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5712190\n",
       "2. 17\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5712190      17"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Creating a new data frame as \"tripdata_2023_v2\"\n",
    "tripdata_2023_v2 <- tripdata_2023[!(tripdata_2023$ride_length > 86400 | tripdata_2023$ride_length <= 0),]\n",
    "\n",
    "#printing the dimention of data set:\n",
    "dim(tripdata_2023_v2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cbc75b75",
   "metadata": {
    "papermill": {
     "duration": 0.012964,
     "end_time": "2024-01-31T09:19:22.247678",
     "exception": false,
     "start_time": "2024-01-31T09:19:22.234714",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "the total number of rows in new data set (tripdata_2023_v2) is 5712190 (down from 5719877 - decreased by 0.13%)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "5d9dc6d0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:22.278337Z",
     "iopub.status.busy": "2024-01-31T09:19:22.276424Z",
     "iopub.status.idle": "2024-01-31T09:19:27.433154Z",
     "shell.execute_reply": "2024-01-31T09:19:27.430161Z"
    },
    "papermill": {
     "duration": 5.175776,
     "end_time": "2024-01-31T09:19:27.436319",
     "exception": false,
     "start_time": "2024-01-31T09:19:22.260543",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 17</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>ride_id</th><th scope=col>rideable_type</th><th scope=col>started_at</th><th scope=col>ended_at</th><th scope=col>start_station_name</th><th scope=col>start_station_id</th><th scope=col>end_station_name</th><th scope=col>end_station_id</th><th scope=col>start_lat</th><th scope=col>start_lng</th><th scope=col>end_lat</th><th scope=col>end_lng</th><th scope=col>member_casual</th><th scope=col>date</th><th scope=col>month</th><th scope=col>day_of_week</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>F96D5A74A3E41399</td><td>electric_bike</td><td>2023-01-21 20:05:42</td><td>2023-01-21 20:16:33</td><td><span style=white-space:pre-wrap>Lincoln Ave &amp; Fullerton Ave  </span></td><td>TA1309000058</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92407</td><td>-87.64628</td><td>41.93000</td><td>-87.64000</td><td>member</td><td>2023-01-21</td><td>01</td><td>Saturday</td><td>651</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>13CB7EB698CEDB88</td><td>classic_bike </td><td>2023-01-10 15:37:36</td><td>2023-01-10 15:46:05</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-10</td><td>01</td><td>Tuesday </td><td>509</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>BD88A2E670661CE5</td><td>electric_bike</td><td>2023-01-02 07:51:57</td><td>2023-01-02 08:05:11</td><td><span style=white-space:pre-wrap>Western Ave &amp; Lunt Ave       </span></td><td><span style=white-space:pre-wrap>RP-005      </span></td><td>Valli Produce - Evanston Plaza</td><td><span style=white-space:pre-wrap>599         </span></td><td>42.00857</td><td>-87.69048</td><td>42.03974</td><td>-87.69941</td><td>casual</td><td>2023-01-02</td><td>01</td><td><span style=white-space:pre-wrap>Monday  </span></td><td>794</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>C90792D034FED968</td><td>classic_bike </td><td>2023-01-22 10:52:58</td><td>2023-01-22 11:01:44</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-22</td><td>01</td><td><span style=white-space:pre-wrap>Sunday  </span></td><td>526</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>3397017529188E8A</td><td>classic_bike </td><td>2023-01-12 13:58:01</td><td>2023-01-12 14:13:20</td><td><span style=white-space:pre-wrap>Kimbark Ave &amp; 53rd St        </span></td><td>TA1309000037</td><td><span style=white-space:pre-wrap>Greenwood Ave &amp; 47th St       </span></td><td>TA1308000002</td><td>41.79957</td><td>-87.59475</td><td>41.80983</td><td>-87.59938</td><td>member</td><td>2023-01-12</td><td>01</td><td>Thursday</td><td>919</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>58E68156DAE3E311</td><td>electric_bike</td><td>2023-01-31 07:18:03</td><td>2023-01-31 07:21:16</td><td>Lakeview Ave &amp; Fullerton Pkwy</td><td>TA1309000019</td><td><span style=white-space:pre-wrap>Hampden Ct &amp; Diversey Ave     </span></td><td><span style=white-space:pre-wrap>202480.0    </span></td><td>41.92607</td><td>-87.63886</td><td>41.93000</td><td>-87.64000</td><td>member</td><td>2023-01-31</td><td>01</td><td>Tuesday </td><td>193</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 17\n",
       "\\begin{tabular}{r|lllllllllllllllll}\n",
       "  & ride\\_id & rideable\\_type & started\\_at & ended\\_at & start\\_station\\_name & start\\_station\\_id & end\\_station\\_name & end\\_station\\_id & start\\_lat & start\\_lng & end\\_lat & end\\_lng & member\\_casual & date & month & day\\_of\\_week & ride\\_length\\\\\n",
       "  & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <chr> & <date> & <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & F96D5A74A3E41399 & electric\\_bike & 2023-01-21 20:05:42 & 2023-01-21 20:16:33 & Lincoln Ave \\& Fullerton Ave   & TA1309000058 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92407 & -87.64628 & 41.93000 & -87.64000 & member & 2023-01-21 & 01 & Saturday & 651\\\\\n",
       "\t2 & 13CB7EB698CEDB88 & classic\\_bike  & 2023-01-10 15:37:36 & 2023-01-10 15:46:05 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-10 & 01 & Tuesday  & 509\\\\\n",
       "\t3 & BD88A2E670661CE5 & electric\\_bike & 2023-01-02 07:51:57 & 2023-01-02 08:05:11 & Western Ave \\& Lunt Ave        & RP-005       & Valli Produce - Evanston Plaza & 599          & 42.00857 & -87.69048 & 42.03974 & -87.69941 & casual & 2023-01-02 & 01 & Monday   & 794\\\\\n",
       "\t4 & C90792D034FED968 & classic\\_bike  & 2023-01-22 10:52:58 & 2023-01-22 11:01:44 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-22 & 01 & Sunday   & 526\\\\\n",
       "\t5 & 3397017529188E8A & classic\\_bike  & 2023-01-12 13:58:01 & 2023-01-12 14:13:20 & Kimbark Ave \\& 53rd St         & TA1309000037 & Greenwood Ave \\& 47th St        & TA1308000002 & 41.79957 & -87.59475 & 41.80983 & -87.59938 & member & 2023-01-12 & 01 & Thursday & 919\\\\\n",
       "\t6 & 58E68156DAE3E311 & electric\\_bike & 2023-01-31 07:18:03 & 2023-01-31 07:21:16 & Lakeview Ave \\& Fullerton Pkwy & TA1309000019 & Hampden Ct \\& Diversey Ave      & 202480.0     & 41.92607 & -87.63886 & 41.93000 & -87.64000 & member & 2023-01-31 & 01 & Tuesday  & 193\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 17\n",
       "\n",
       "| <!--/--> | ride_id &lt;chr&gt; | rideable_type &lt;chr&gt; | started_at &lt;chr&gt; | ended_at &lt;chr&gt; | start_station_name &lt;chr&gt; | start_station_id &lt;chr&gt; | end_station_name &lt;chr&gt; | end_station_id &lt;chr&gt; | start_lat &lt;dbl&gt; | start_lng &lt;dbl&gt; | end_lat &lt;dbl&gt; | end_lng &lt;dbl&gt; | member_casual &lt;chr&gt; | date &lt;date&gt; | month &lt;chr&gt; | day_of_week &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | F96D5A74A3E41399 | electric_bike | 2023-01-21 20:05:42 | 2023-01-21 20:16:33 | Lincoln Ave &amp; Fullerton Ave   | TA1309000058 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92407 | -87.64628 | 41.93000 | -87.64000 | member | 2023-01-21 | 01 | Saturday | 651 |\n",
       "| 2 | 13CB7EB698CEDB88 | classic_bike  | 2023-01-10 15:37:36 | 2023-01-10 15:46:05 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-10 | 01 | Tuesday  | 509 |\n",
       "| 3 | BD88A2E670661CE5 | electric_bike | 2023-01-02 07:51:57 | 2023-01-02 08:05:11 | Western Ave &amp; Lunt Ave        | RP-005       | Valli Produce - Evanston Plaza | 599          | 42.00857 | -87.69048 | 42.03974 | -87.69941 | casual | 2023-01-02 | 01 | Monday   | 794 |\n",
       "| 4 | C90792D034FED968 | classic_bike  | 2023-01-22 10:52:58 | 2023-01-22 11:01:44 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-22 | 01 | Sunday   | 526 |\n",
       "| 5 | 3397017529188E8A | classic_bike  | 2023-01-12 13:58:01 | 2023-01-12 14:13:20 | Kimbark Ave &amp; 53rd St         | TA1309000037 | Greenwood Ave &amp; 47th St        | TA1308000002 | 41.79957 | -87.59475 | 41.80983 | -87.59938 | member | 2023-01-12 | 01 | Thursday | 919 |\n",
       "| 6 | 58E68156DAE3E311 | electric_bike | 2023-01-31 07:18:03 | 2023-01-31 07:21:16 | Lakeview Ave &amp; Fullerton Pkwy | TA1309000019 | Hampden Ct &amp; Diversey Ave      | 202480.0     | 41.92607 | -87.63886 | 41.93000 | -87.64000 | member | 2023-01-31 | 01 | Tuesday  | 193 |\n",
       "\n"
      ],
      "text/plain": [
       "  ride_id          rideable_type started_at          ended_at           \n",
       "1 F96D5A74A3E41399 electric_bike 2023-01-21 20:05:42 2023-01-21 20:16:33\n",
       "2 13CB7EB698CEDB88 classic_bike  2023-01-10 15:37:36 2023-01-10 15:46:05\n",
       "3 BD88A2E670661CE5 electric_bike 2023-01-02 07:51:57 2023-01-02 08:05:11\n",
       "4 C90792D034FED968 classic_bike  2023-01-22 10:52:58 2023-01-22 11:01:44\n",
       "5 3397017529188E8A classic_bike  2023-01-12 13:58:01 2023-01-12 14:13:20\n",
       "6 58E68156DAE3E311 electric_bike 2023-01-31 07:18:03 2023-01-31 07:21:16\n",
       "  start_station_name            start_station_id end_station_name              \n",
       "1 Lincoln Ave & Fullerton Ave   TA1309000058     Hampden Ct & Diversey Ave     \n",
       "2 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "3 Western Ave & Lunt Ave        RP-005           Valli Produce - Evanston Plaza\n",
       "4 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "5 Kimbark Ave & 53rd St         TA1309000037     Greenwood Ave & 47th St       \n",
       "6 Lakeview Ave & Fullerton Pkwy TA1309000019     Hampden Ct & Diversey Ave     \n",
       "  end_station_id start_lat start_lng end_lat  end_lng   member_casual\n",
       "1 202480.0       41.92407  -87.64628 41.93000 -87.64000 member       \n",
       "2 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "3 599            42.00857  -87.69048 42.03974 -87.69941 casual       \n",
       "4 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "5 TA1308000002   41.79957  -87.59475 41.80983 -87.59938 member       \n",
       "6 202480.0       41.92607  -87.63886 41.93000 -87.64000 member       \n",
       "  date       month day_of_week ride_length\n",
       "1 2023-01-21 01    Saturday    651        \n",
       "2 2023-01-10 01    Tuesday     509        \n",
       "3 2023-01-02 01    Monday      794        \n",
       "4 2023-01-22 01    Sunday      526        \n",
       "5 2023-01-12 01    Thursday    919        \n",
       "6 2023-01-31 01    Tuesday     193        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5712190     Length:5712190     Length:5712190     Length:5712190    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5712190     Length:5712190     Length:5712190     Length:5712190    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.63   Min.   :-87.94   Min.   : 0.00   Min.   :-88.16  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :42.07   Max.   :-87.46   Max.   :42.18   Max.   :  0.00  \n",
       "                                  NA's   :791     NA's   :791     \n",
       " member_casual           date               month           day_of_week       \n",
       " Length:5712190     Min.   :2023-01-01   Length:5712190     Length:5712190    \n",
       " Class :character   1st Qu.:2023-05-21   Class :character   Class :character  \n",
       " Mode  :character   Median :2023-07-20   Mode  :character   Mode  :character  \n",
       "                    Mean   :2023-07-15                                        \n",
       "                    3rd Qu.:2023-09-16                                        \n",
       "                    Max.   :2023-12-31                                        \n",
       "                                                                              \n",
       "  ride_length     \n",
       " Min.   :    1.0  \n",
       " 1st Qu.:  325.0  \n",
       " Median :  571.0  \n",
       " Mean   :  909.8  \n",
       " 3rd Qu.: 1013.0  \n",
       " Max.   :86395.0  \n",
       "                  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Printing the first 6 rows and the summary of new data set:\n",
    "head(tripdata_2023_v2)\n",
    "\n",
    "#printing out thr summary to check our data\n",
    "summary(tripdata_2023_v2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "356e0a07",
   "metadata": {
    "papermill": {
     "duration": 0.014168,
     "end_time": "2024-01-31T09:19:27.465737",
     "exception": false,
     "start_time": "2024-01-31T09:19:27.451569",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Also we should remove the NA rows from data set as part od cleaning"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "9cb55065",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:27.497536Z",
     "iopub.status.busy": "2024-01-31T09:19:27.495686Z",
     "iopub.status.idle": "2024-01-31T09:19:35.345914Z",
     "shell.execute_reply": "2024-01-31T09:19:35.343930Z"
    },
    "papermill": {
     "duration": 7.869573,
     "end_time": "2024-01-31T09:19:35.348988",
     "exception": false,
     "start_time": "2024-01-31T09:19:27.479415",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5711399</li><li>17</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5711399\n",
       "\\item 17\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5711399\n",
       "2. 17\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5711399      17"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Drope the NAs\n",
    "tripdata_2023_v2 <- drop_na(tripdata_2023_v2)\n",
    "\n",
    "#print dimention of data set to find out the number of NA rows which have been removed\n",
    "dim(tripdata_2023_v2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "63f93678",
   "metadata": {
    "papermill": {
     "duration": 0.01398,
     "end_time": "2024-01-31T09:19:35.376994",
     "exception": false,
     "start_time": "2024-01-31T09:19:35.363014",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "the total number of rows is 5711399 (decreased from 5712190)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "7ebf46d8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:35.409522Z",
     "iopub.status.busy": "2024-01-31T09:19:35.407788Z",
     "iopub.status.idle": "2024-01-31T09:19:39.108222Z",
     "shell.execute_reply": "2024-01-31T09:19:39.105712Z"
    },
    "papermill": {
     "duration": 3.720633,
     "end_time": "2024-01-31T09:19:39.111961",
     "exception": false,
     "start_time": "2024-01-31T09:19:35.391328",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5711399     Length:5711399     Length:5711399     Length:5711399    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5711399     Length:5711399     Length:5711399     Length:5711399    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.63   Min.   :-87.94   Min.   : 0.00   Min.   :-88.16  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :42.07   Max.   :-87.46   Max.   :42.18   Max.   :  0.00  \n",
       " member_casual           date               month           day_of_week       \n",
       " Length:5711399     Min.   :2023-01-01   Length:5711399     Length:5711399    \n",
       " Class :character   1st Qu.:2023-05-21   Class :character   Class :character  \n",
       " Mode  :character   Median :2023-07-20   Mode  :character   Mode  :character  \n",
       "                    Mean   :2023-07-15                                        \n",
       "                    3rd Qu.:2023-09-16                                        \n",
       "                    Max.   :2023-12-31                                        \n",
       "  ride_length     \n",
       " Min.   :    1.0  \n",
       " 1st Qu.:  325.0  \n",
       " Median :  571.0  \n",
       " Mean   :  905.9  \n",
       " 3rd Qu.: 1013.0  \n",
       " Max.   :86392.0  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#printing out thr summary to check our data\n",
    "summary(tripdata_2023_v2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "61d1ef0d",
   "metadata": {
    "papermill": {
     "duration": 0.014302,
     "end_time": "2024-01-31T09:19:39.140939",
     "exception": false,
     "start_time": "2024-01-31T09:19:39.126637",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The ride ID should be specifice for each ride, even if the riders were the same.\n",
    "so another step in data cleaning is to remove duplicated ride ID."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "35054e5e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:39.174175Z",
     "iopub.status.busy": "2024-01-31T09:19:39.172445Z",
     "iopub.status.idle": "2024-01-31T09:19:50.415240Z",
     "shell.execute_reply": "2024-01-31T09:19:50.412254Z"
    },
    "papermill": {
     "duration": 11.263827,
     "end_time": "2024-01-31T09:19:50.419183",
     "exception": false,
     "start_time": "2024-01-31T09:19:39.155356",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>5711399</li><li>17</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 5711399\n",
       "\\item 17\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 5711399\n",
       "2. 17\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 5711399      17"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# removing duplicated ride ID\n",
    "\n",
    "tripdata_2023_v3 <- tripdata_2023_v2[!duplicated(tripdata_2023_v2$ride_id),]\n",
    "\n",
    "# print out dimention to confirme the process\n",
    "dim(tripdata_2023_v3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "29e4b94d",
   "metadata": {
    "papermill": {
     "duration": 0.015015,
     "end_time": "2024-01-31T09:19:50.448898",
     "exception": false,
     "start_time": "2024-01-31T09:19:50.433883",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "the total number of rows in the new data set (tripdata_2023_v3) is 5711399 (remain the same, it seems that there was no duplicated ride_id)\n",
    "\n",
    "The Data Cleaning process has been completed with the last steps."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "029850dc",
   "metadata": {
    "papermill": {
     "duration": 0.015685,
     "end_time": "2024-01-31T09:19:50.480913",
     "exception": false,
     "start_time": "2024-01-31T09:19:50.465228",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Analyze\n",
    "\n",
    "in the first step we will find the number of rides by type of riders,\n",
    "\n",
    "1- in every day of week\n",
    "\n",
    "2- in each month of the zear 2023"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "5dc913fa",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:50.517891Z",
     "iopub.status.busy": "2024-01-31T09:19:50.515741Z",
     "iopub.status.idle": "2024-01-31T09:19:50.901727Z",
     "shell.execute_reply": "2024-01-31T09:19:50.899714Z"
    },
    "papermill": {
     "duration": 0.406714,
     "end_time": "2024-01-31T09:19:50.904574",
     "exception": false,
     "start_time": "2024-01-31T09:19:50.497860",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>day_of_week</th><th scope=col>number_of_ride</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>310965</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td>531327</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>234118</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td>494328</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>409275</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td>472588</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>334393</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td>408612</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>269828</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td>589309</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>245529</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td>576459</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>248479</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td>586189</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & day\\_of\\_week & number\\_of\\_ride\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 310965\\\\\n",
       "\t member & Friday    & 531327\\\\\n",
       "\t casual & Monday    & 234118\\\\\n",
       "\t member & Monday    & 494328\\\\\n",
       "\t casual & Saturday  & 409275\\\\\n",
       "\t member & Saturday  & 472588\\\\\n",
       "\t casual & Sunday    & 334393\\\\\n",
       "\t member & Sunday    & 408612\\\\\n",
       "\t casual & Thursday  & 269828\\\\\n",
       "\t member & Thursday  & 589309\\\\\n",
       "\t casual & Tuesday   & 245529\\\\\n",
       "\t member & Tuesday   & 576459\\\\\n",
       "\t casual & Wednesday & 248479\\\\\n",
       "\t member & Wednesday & 586189\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 14 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | day_of_week &lt;chr&gt; | number_of_ride &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 310965 |\n",
       "| member | Friday    | 531327 |\n",
       "| casual | Monday    | 234118 |\n",
       "| member | Monday    | 494328 |\n",
       "| casual | Saturday  | 409275 |\n",
       "| member | Saturday  | 472588 |\n",
       "| casual | Sunday    | 334393 |\n",
       "| member | Sunday    | 408612 |\n",
       "| casual | Thursday  | 269828 |\n",
       "| member | Thursday  | 589309 |\n",
       "| casual | Tuesday   | 245529 |\n",
       "| member | Tuesday   | 576459 |\n",
       "| casual | Wednesday | 248479 |\n",
       "| member | Wednesday | 586189 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual day_of_week number_of_ride\n",
       "1  casual        Friday      310965        \n",
       "2  member        Friday      531327        \n",
       "3  casual        Monday      234118        \n",
       "4  member        Monday      494328        \n",
       "5  casual        Saturday    409275        \n",
       "6  member        Saturday    472588        \n",
       "7  casual        Sunday      334393        \n",
       "8  member        Sunday      408612        \n",
       "9  casual        Thursday    269828        \n",
       "10 member        Thursday    589309        \n",
       "11 casual        Tuesday     245529        \n",
       "12 member        Tuesday     576459        \n",
       "13 casual        Wednesday   248479        \n",
       "14 member        Wednesday   586189        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Assign the correct order to each day of the week\n",
    "\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual, day_of_week) %>%\n",
    "    summarise(number_of_ride = n(), .groups = 'drop') %>%\n",
    "    arrange(day_of_week)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "6bdb0e3e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:50.938995Z",
     "iopub.status.busy": "2024-01-31T09:19:50.937109Z",
     "iopub.status.idle": "2024-01-31T09:19:51.226680Z",
     "shell.execute_reply": "2024-01-31T09:19:51.224264Z"
    },
    "papermill": {
     "duration": 0.31051,
     "end_time": "2024-01-31T09:19:51.229914",
     "exception": false,
     "start_time": "2024-01-31T09:19:50.919404",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 24 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>month</th><th scope=col>number_of_ride</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>01</td><td> 39899</td></tr>\n",
       "\t<tr><td>member</td><td>01</td><td>150258</td></tr>\n",
       "\t<tr><td>casual</td><td>02</td><td> 42919</td></tr>\n",
       "\t<tr><td>member</td><td>02</td><td>147397</td></tr>\n",
       "\t<tr><td>casual</td><td>03</td><td> 62040</td></tr>\n",
       "\t<tr><td>member</td><td>03</td><td>196432</td></tr>\n",
       "\t<tr><td>casual</td><td>04</td><td>146868</td></tr>\n",
       "\t<tr><td>member</td><td>04</td><td>279241</td></tr>\n",
       "\t<tr><td>casual</td><td>05</td><td>233549</td></tr>\n",
       "\t<tr><td>member</td><td>05</td><td>370483</td></tr>\n",
       "\t<tr><td>casual</td><td>06</td><td>300384</td></tr>\n",
       "\t<tr><td>member</td><td>06</td><td>418246</td></tr>\n",
       "\t<tr><td>casual</td><td>07</td><td>330123</td></tr>\n",
       "\t<tr><td>member</td><td>07</td><td>436036</td></tr>\n",
       "\t<tr><td>casual</td><td>08</td><td>309908</td></tr>\n",
       "\t<tr><td>member</td><td>08</td><td>460238</td></tr>\n",
       "\t<tr><td>casual</td><td>09</td><td>260819</td></tr>\n",
       "\t<tr><td>member</td><td>09</td><td>404473</td></tr>\n",
       "\t<tr><td>casual</td><td>10</td><td>176540</td></tr>\n",
       "\t<tr><td>member</td><td>10</td><td>359802</td></tr>\n",
       "\t<tr><td>casual</td><td>11</td><td> 98060</td></tr>\n",
       "\t<tr><td>member</td><td>11</td><td>263929</td></tr>\n",
       "\t<tr><td>casual</td><td>12</td><td> 51478</td></tr>\n",
       "\t<tr><td>member</td><td>12</td><td>172277</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 24 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & month & number\\_of\\_ride\\\\\n",
       " <chr> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & 01 &  39899\\\\\n",
       "\t member & 01 & 150258\\\\\n",
       "\t casual & 02 &  42919\\\\\n",
       "\t member & 02 & 147397\\\\\n",
       "\t casual & 03 &  62040\\\\\n",
       "\t member & 03 & 196432\\\\\n",
       "\t casual & 04 & 146868\\\\\n",
       "\t member & 04 & 279241\\\\\n",
       "\t casual & 05 & 233549\\\\\n",
       "\t member & 05 & 370483\\\\\n",
       "\t casual & 06 & 300384\\\\\n",
       "\t member & 06 & 418246\\\\\n",
       "\t casual & 07 & 330123\\\\\n",
       "\t member & 07 & 436036\\\\\n",
       "\t casual & 08 & 309908\\\\\n",
       "\t member & 08 & 460238\\\\\n",
       "\t casual & 09 & 260819\\\\\n",
       "\t member & 09 & 404473\\\\\n",
       "\t casual & 10 & 176540\\\\\n",
       "\t member & 10 & 359802\\\\\n",
       "\t casual & 11 &  98060\\\\\n",
       "\t member & 11 & 263929\\\\\n",
       "\t casual & 12 &  51478\\\\\n",
       "\t member & 12 & 172277\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 24 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | month &lt;chr&gt; | number_of_ride &lt;int&gt; |\n",
       "|---|---|---|\n",
       "| casual | 01 |  39899 |\n",
       "| member | 01 | 150258 |\n",
       "| casual | 02 |  42919 |\n",
       "| member | 02 | 147397 |\n",
       "| casual | 03 |  62040 |\n",
       "| member | 03 | 196432 |\n",
       "| casual | 04 | 146868 |\n",
       "| member | 04 | 279241 |\n",
       "| casual | 05 | 233549 |\n",
       "| member | 05 | 370483 |\n",
       "| casual | 06 | 300384 |\n",
       "| member | 06 | 418246 |\n",
       "| casual | 07 | 330123 |\n",
       "| member | 07 | 436036 |\n",
       "| casual | 08 | 309908 |\n",
       "| member | 08 | 460238 |\n",
       "| casual | 09 | 260819 |\n",
       "| member | 09 | 404473 |\n",
       "| casual | 10 | 176540 |\n",
       "| member | 10 | 359802 |\n",
       "| casual | 11 |  98060 |\n",
       "| member | 11 | 263929 |\n",
       "| casual | 12 |  51478 |\n",
       "| member | 12 | 172277 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual month number_of_ride\n",
       "1  casual        01     39899        \n",
       "2  member        01    150258        \n",
       "3  casual        02     42919        \n",
       "4  member        02    147397        \n",
       "5  casual        03     62040        \n",
       "6  member        03    196432        \n",
       "7  casual        04    146868        \n",
       "8  member        04    279241        \n",
       "9  casual        05    233549        \n",
       "10 member        05    370483        \n",
       "11 casual        06    300384        \n",
       "12 member        06    418246        \n",
       "13 casual        07    330123        \n",
       "14 member        07    436036        \n",
       "15 casual        08    309908        \n",
       "16 member        08    460238        \n",
       "17 casual        09    260819        \n",
       "18 member        09    404473        \n",
       "19 casual        10    176540        \n",
       "20 member        10    359802        \n",
       "21 casual        11     98060        \n",
       "22 member        11    263929        \n",
       "23 casual        12     51478        \n",
       "24 member        12    172277        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Assign the correct order to each month of the year\n",
    "\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual, month) %>%\n",
    "    summarise(number_of_ride = n(), .groups = 'drop') %>%\n",
    "    arrange(month)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "1fffda6e",
   "metadata": {
    "papermill": {
     "duration": 0.015121,
     "end_time": "2024-01-31T09:19:51.260841",
     "exception": false,
     "start_time": "2024-01-31T09:19:51.245720",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Findings:\n",
    "\n",
    "1- It's clear that the casual memebers take a ride mostly in weekends while the memebership riders ofently use shared bikes during the weekdays.\n",
    "\n",
    "2- the month june to augest as sommer season is the peak month for the both rider types.\n",
    "\n",
    "in the second step we can find the relation between the length of rides for each type of rider during the days of week."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "2eaad708",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:51.298190Z",
     "iopub.status.busy": "2024-01-31T09:19:51.295812Z",
     "iopub.status.idle": "2024-01-31T09:19:58.000225Z",
     "shell.execute_reply": "2024-01-31T09:19:57.997233Z"
    },
    "papermill": {
     "duration": 6.732749,
     "end_time": "2024-01-31T09:19:58.008437",
     "exception": false,
     "start_time": "2024-01-31T09:19:51.275688",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 14 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>day_of_week</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>Friday   </td><td>1195.1435</td></tr>\n",
       "\t<tr><td>member</td><td>Friday   </td><td> 719.2857</td></tr>\n",
       "\t<tr><td>casual</td><td>Monday   </td><td>1213.1615</td></tr>\n",
       "\t<tr><td>member</td><td>Monday   </td><td> 686.9671</td></tr>\n",
       "\t<tr><td>casual</td><td>Saturday </td><td>1393.4851</td></tr>\n",
       "\t<tr><td>member</td><td>Saturday </td><td> 804.4404</td></tr>\n",
       "\t<tr><td>casual</td><td>Sunday   </td><td>1433.9087</td></tr>\n",
       "\t<tr><td>member</td><td>Sunday   </td><td> 806.2474</td></tr>\n",
       "\t<tr><td>casual</td><td>Thursday </td><td>1074.7246</td></tr>\n",
       "\t<tr><td>member</td><td>Thursday </td><td> 694.4885</td></tr>\n",
       "\t<tr><td>casual</td><td>Tuesday  </td><td>1102.2182</td></tr>\n",
       "\t<tr><td>member</td><td>Tuesday  </td><td> 694.8608</td></tr>\n",
       "\t<tr><td>casual</td><td>Wednesday</td><td>1054.8573</td></tr>\n",
       "\t<tr><td>member</td><td>Wednesday</td><td> 690.4483</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 14 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & day\\_of\\_week & ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & Friday    & 1195.1435\\\\\n",
       "\t member & Friday    &  719.2857\\\\\n",
       "\t casual & Monday    & 1213.1615\\\\\n",
       "\t member & Monday    &  686.9671\\\\\n",
       "\t casual & Saturday  & 1393.4851\\\\\n",
       "\t member & Saturday  &  804.4404\\\\\n",
       "\t casual & Sunday    & 1433.9087\\\\\n",
       "\t member & Sunday    &  806.2474\\\\\n",
       "\t casual & Thursday  & 1074.7246\\\\\n",
       "\t member & Thursday  &  694.4885\\\\\n",
       "\t casual & Tuesday   & 1102.2182\\\\\n",
       "\t member & Tuesday   &  694.8608\\\\\n",
       "\t casual & Wednesday & 1054.8573\\\\\n",
       "\t member & Wednesday &  690.4483\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 14 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | day_of_week &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | Friday    | 1195.1435 |\n",
       "| member | Friday    |  719.2857 |\n",
       "| casual | Monday    | 1213.1615 |\n",
       "| member | Monday    |  686.9671 |\n",
       "| casual | Saturday  | 1393.4851 |\n",
       "| member | Saturday  |  804.4404 |\n",
       "| casual | Sunday    | 1433.9087 |\n",
       "| member | Sunday    |  806.2474 |\n",
       "| casual | Thursday  | 1074.7246 |\n",
       "| member | Thursday  |  694.4885 |\n",
       "| casual | Tuesday   | 1102.2182 |\n",
       "| member | Tuesday   |  694.8608 |\n",
       "| casual | Wednesday | 1054.8573 |\n",
       "| member | Wednesday |  690.4483 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual day_of_week ride_length\n",
       "1  casual        Friday      1195.1435  \n",
       "2  member        Friday       719.2857  \n",
       "3  casual        Monday      1213.1615  \n",
       "4  member        Monday       686.9671  \n",
       "5  casual        Saturday    1393.4851  \n",
       "6  member        Saturday     804.4404  \n",
       "7  casual        Sunday      1433.9087  \n",
       "8  member        Sunday       806.2474  \n",
       "9  casual        Thursday    1074.7246  \n",
       "10 member        Thursday     694.4885  \n",
       "11 casual        Tuesday     1102.2182  \n",
       "12 member        Tuesday      694.8608  \n",
       "13 casual        Wednesday   1054.8573  \n",
       "14 member        Wednesday    690.4483  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# using aggregate function to get the summary statistics of the data\n",
    "\n",
    "aggregate(ride_length ~ member_casual + day_of_week,tripdata_2023_v3, FUN=mean)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "3d3a9fe1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:19:58.053126Z",
     "iopub.status.busy": "2024-01-31T09:19:58.050389Z",
     "iopub.status.idle": "2024-01-31T09:20:04.819446Z",
     "shell.execute_reply": "2024-01-31T09:20:04.817368Z"
    },
    "papermill": {
     "duration": 6.791367,
     "end_time": "2024-01-31T09:20:04.822214",
     "exception": false,
     "start_time": "2024-01-31T09:19:58.030847",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 24 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>month</th><th scope=col>ride_length</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>01</td><td> 808.8740</td></tr>\n",
       "\t<tr><td>member</td><td>01</td><td> 603.9154</td></tr>\n",
       "\t<tr><td>casual</td><td>02</td><td> 954.0863</td></tr>\n",
       "\t<tr><td>member</td><td>02</td><td> 627.7692</td></tr>\n",
       "\t<tr><td>casual</td><td>03</td><td> 908.7547</td></tr>\n",
       "\t<tr><td>member</td><td>03</td><td> 611.5430</td></tr>\n",
       "\t<tr><td>casual</td><td>04</td><td>1217.6026</td></tr>\n",
       "\t<tr><td>member</td><td>04</td><td> 687.6074</td></tr>\n",
       "\t<tr><td>casual</td><td>05</td><td>1312.1268</td></tr>\n",
       "\t<tr><td>member</td><td>05</td><td> 753.6627</td></tr>\n",
       "\t<tr><td>casual</td><td>06</td><td>1292.8739</td></tr>\n",
       "\t<tr><td>member</td><td>06</td><td> 770.9521</td></tr>\n",
       "\t<tr><td>casual</td><td>07</td><td>1358.1995</td></tr>\n",
       "\t<tr><td>member</td><td>07</td><td> 791.5641</td></tr>\n",
       "\t<tr><td>casual</td><td>08</td><td>1309.7239</td></tr>\n",
       "\t<tr><td>member</td><td>08</td><td> 789.7201</td></tr>\n",
       "\t<tr><td>casual</td><td>09</td><td>1269.1766</td></tr>\n",
       "\t<tr><td>member</td><td>09</td><td> 757.1716</td></tr>\n",
       "\t<tr><td>casual</td><td>10</td><td>1138.3524</td></tr>\n",
       "\t<tr><td>member</td><td>10</td><td> 693.2542</td></tr>\n",
       "\t<tr><td>casual</td><td>11</td><td> 953.1469</td></tr>\n",
       "\t<tr><td>member</td><td>11</td><td> 656.4799</td></tr>\n",
       "\t<tr><td>casual</td><td>12</td><td> 879.0326</td></tr>\n",
       "\t<tr><td>member</td><td>12</td><td> 646.0235</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 24 × 3\n",
       "\\begin{tabular}{lll}\n",
       " member\\_casual & month & ride\\_length\\\\\n",
       " <chr> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t casual & 01 &  808.8740\\\\\n",
       "\t member & 01 &  603.9154\\\\\n",
       "\t casual & 02 &  954.0863\\\\\n",
       "\t member & 02 &  627.7692\\\\\n",
       "\t casual & 03 &  908.7547\\\\\n",
       "\t member & 03 &  611.5430\\\\\n",
       "\t casual & 04 & 1217.6026\\\\\n",
       "\t member & 04 &  687.6074\\\\\n",
       "\t casual & 05 & 1312.1268\\\\\n",
       "\t member & 05 &  753.6627\\\\\n",
       "\t casual & 06 & 1292.8739\\\\\n",
       "\t member & 06 &  770.9521\\\\\n",
       "\t casual & 07 & 1358.1995\\\\\n",
       "\t member & 07 &  791.5641\\\\\n",
       "\t casual & 08 & 1309.7239\\\\\n",
       "\t member & 08 &  789.7201\\\\\n",
       "\t casual & 09 & 1269.1766\\\\\n",
       "\t member & 09 &  757.1716\\\\\n",
       "\t casual & 10 & 1138.3524\\\\\n",
       "\t member & 10 &  693.2542\\\\\n",
       "\t casual & 11 &  953.1469\\\\\n",
       "\t member & 11 &  656.4799\\\\\n",
       "\t casual & 12 &  879.0326\\\\\n",
       "\t member & 12 &  646.0235\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 24 × 3\n",
       "\n",
       "| member_casual &lt;chr&gt; | month &lt;chr&gt; | ride_length &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| casual | 01 |  808.8740 |\n",
       "| member | 01 |  603.9154 |\n",
       "| casual | 02 |  954.0863 |\n",
       "| member | 02 |  627.7692 |\n",
       "| casual | 03 |  908.7547 |\n",
       "| member | 03 |  611.5430 |\n",
       "| casual | 04 | 1217.6026 |\n",
       "| member | 04 |  687.6074 |\n",
       "| casual | 05 | 1312.1268 |\n",
       "| member | 05 |  753.6627 |\n",
       "| casual | 06 | 1292.8739 |\n",
       "| member | 06 |  770.9521 |\n",
       "| casual | 07 | 1358.1995 |\n",
       "| member | 07 |  791.5641 |\n",
       "| casual | 08 | 1309.7239 |\n",
       "| member | 08 |  789.7201 |\n",
       "| casual | 09 | 1269.1766 |\n",
       "| member | 09 |  757.1716 |\n",
       "| casual | 10 | 1138.3524 |\n",
       "| member | 10 |  693.2542 |\n",
       "| casual | 11 |  953.1469 |\n",
       "| member | 11 |  656.4799 |\n",
       "| casual | 12 |  879.0326 |\n",
       "| member | 12 |  646.0235 |\n",
       "\n"
      ],
      "text/plain": [
       "   member_casual month ride_length\n",
       "1  casual        01     808.8740  \n",
       "2  member        01     603.9154  \n",
       "3  casual        02     954.0863  \n",
       "4  member        02     627.7692  \n",
       "5  casual        03     908.7547  \n",
       "6  member        03     611.5430  \n",
       "7  casual        04    1217.6026  \n",
       "8  member        04     687.6074  \n",
       "9  casual        05    1312.1268  \n",
       "10 member        05     753.6627  \n",
       "11 casual        06    1292.8739  \n",
       "12 member        06     770.9521  \n",
       "13 casual        07    1358.1995  \n",
       "14 member        07     791.5641  \n",
       "15 casual        08    1309.7239  \n",
       "16 member        08     789.7201  \n",
       "17 casual        09    1269.1766  \n",
       "18 member        09     757.1716  \n",
       "19 casual        10    1138.3524  \n",
       "20 member        10     693.2542  \n",
       "21 casual        11     953.1469  \n",
       "22 member        11     656.4799  \n",
       "23 casual        12     879.0326  \n",
       "24 member        12     646.0235  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#calculating the mean length of rides for each month per member_casual\n",
    "\n",
    "aggregate(ride_length ~ member_casual + month, tripdata_2023_v3, FUN=mean)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9f405a5f",
   "metadata": {
    "papermill": {
     "duration": 0.015665,
     "end_time": "2024-01-31T09:20:04.853919",
     "exception": false,
     "start_time": "2024-01-31T09:20:04.838254",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Findings:\n",
    "\n",
    "1- Membership rider's trip is shorter than casual ones regardless of the season or day. it means that the casuals ride the longer distance!!!\n",
    "\n",
    "2- the casuals take much longer ride during the summer season, both of the riders types take longer rides at weekends but there is not so significant difference for the membership riders\n",
    "\n",
    "in the second step we can find the relation between the length of rides for each type of rider during the days of week.\n",
    "\n",
    "in the last step lets find out that how many rides start and end in the same station grouping by casual and memebership riders"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "10fd94ec",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:20:04.889403Z",
     "iopub.status.busy": "2024-01-31T09:20:04.887633Z",
     "iopub.status.idle": "2024-01-31T09:20:05.680938Z",
     "shell.execute_reply": "2024-01-31T09:20:05.678854Z"
    },
    "papermill": {
     "duration": 0.814095,
     "end_time": "2024-01-31T09:20:05.683775",
     "exception": false,
     "start_time": "2024-01-31T09:20:04.869680",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>2052587</td></tr>\n",
       "\t<tr><td>member</td><td>3658812</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & number\\_of\\_rides\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & 2052587\\\\\n",
       "\t member & 3658812\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|\n",
       "| casual | 2052587 |\n",
       "| member | 3658812 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual number_of_rides\n",
       "1 casual        2052587        \n",
       "2 member        3658812        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 2 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>member_casual</th><th scope=col>number_of_rides</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>casual</td><td>155757</td></tr>\n",
       "\t<tr><td>member</td><td>131999</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 2 × 2\n",
       "\\begin{tabular}{ll}\n",
       " member\\_casual & number\\_of\\_rides\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t casual & 155757\\\\\n",
       "\t member & 131999\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 2 × 2\n",
       "\n",
       "| member_casual &lt;chr&gt; | number_of_rides &lt;int&gt; |\n",
       "|---|---|\n",
       "| casual | 155757 |\n",
       "| member | 131999 |\n",
       "\n"
      ],
      "text/plain": [
       "  member_casual number_of_rides\n",
       "1 casual        155757         \n",
       "2 member        131999         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# grouping all riders by casual and memebers\n",
    "\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual) %>%\n",
    "    summarize(number_of_rides = n(), .groups = 'drop')\n",
    "\n",
    "# filtering the rides which started and ended in the same station\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual) %>%\n",
    "    filter(start_lat == end_lat & start_lng == end_lng) %>%\n",
    "    summarize(number_of_rides = n() , .groups = 'drop')"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "fbb1a765",
   "metadata": {
    "papermill": {
     "duration": 0.016183,
     "end_time": "2024-01-31T09:20:05.716326",
     "exception": false,
     "start_time": "2024-01-31T09:20:05.700143",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "#### Findings:\n",
    "\n",
    "the 3.5% of memebership riders return the bikes to their start station while the 7.5% of casual riders return the bikes to their start point.\n",
    "\n",
    "## Share\n",
    "\n",
    "in share phase I would use ggplot to make visualization of data analysis in order to make it clear to understand"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "b2617942",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:20:05.753277Z",
     "iopub.status.busy": "2024-01-31T09:20:05.751308Z",
     "iopub.status.idle": "2024-01-31T09:20:05.770724Z",
     "shell.execute_reply": "2024-01-31T09:20:05.768305Z"
    },
    "papermill": {
     "duration": 0.041072,
     "end_time": "2024-01-31T09:20:05.773683",
     "exception": false,
     "start_time": "2024-01-31T09:20:05.732611",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#adding libraries\n",
    "library(ggplot2)\n",
    "library(dplyr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "ccab9249",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:20:05.810153Z",
     "iopub.status.busy": "2024-01-31T09:20:05.808328Z",
     "iopub.status.idle": "2024-01-31T09:20:07.755871Z",
     "shell.execute_reply": "2024-01-31T09:20:07.753798Z"
    },
    "papermill": {
     "duration": 1.969365,
     "end_time": "2024-01-31T09:20:07.759256",
     "exception": false,
     "start_time": "2024-01-31T09:20:05.789891",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nHQAAgCL+P2/jFoaRybVpAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "bp <- tripdata_2023_v3 %>%\n",
    "        group_by(member_casual) %>%\n",
    "        summarize(number_of_rides = n(), .groups = 'drop') %>%\n",
    "        ggplot(aes(x = \"\", y = number_of_rides, fill = member_casual))+\n",
    "        geom_bar(stat='identity', width = 1, color='white')\n",
    "\n",
    "pie <- bp + coord_polar(\"y\", start=0)\n",
    "pie \n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "8a78b0f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:20:07.798232Z",
     "iopub.status.busy": "2024-01-31T09:20:07.796413Z",
     "iopub.status.idle": "2024-01-31T09:20:08.995610Z",
     "shell.execute_reply": "2024-01-31T09:20:08.993513Z"
    },
    "papermill": {
     "duration": 1.221796,
     "end_time": "2024-01-31T09:20:08.998609",
     "exception": false,
     "start_time": "2024-01-31T09:20:07.776813",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\n0ZZhKbzGDgAgEsIOACASwg4AIBLCDgAgEsIOACASdfddsdS6xKgxaZ5xWsf2aZ4RANLJFTsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEhk1fYCoA5JjBqTzummdWyfzukAqHWu2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEIqu2FwC1rMG1l6Rvsr27p28uAOoeYQfUoMSo\nMemcblrH9umcDmBV46lYAIBICDsAgEgIOwCASNRC2BXNnrWwIpn+eQEA4pbuN08UzRh7TO+r\ndrr9P8e2qL+8Y1SMevi2p0e/N2leZoeOf+t10lFt8n/Zxc9j+/e58uPFTz36nkcOaJq3YksG\nAPhrSGvYJSsW3XbOzfPKV+hy3YTHz79x2PeH9Tvx6MZlz94xqP+/Sobe0a/ywuPsD2bXa/qP\nU/psVHVy6wbZK7ZkAIC/jLSG3fv39n+/0c7h5+eWf4hkyQ3DPm97yHUH79Y2hLDeNYmDj7hm\n6OReh69VP4Qw9bO5hRtut912Gy1rFACACKXvNXZzvn7iipFFF1x00OIHk2UzHxt81cnHHnVQ\nt54nnXv1S+Nn/e5RyWTxd99NqrpbPGf0xKLy3Xdfq/JubuEOnQpyxo36qfLuB3OLG3cqLF80\n96eps72IDwCoa9J0xa6i5MfLLxi619l3tMvPXPz4A+eeOnLRRn37nNaqYWL82GcHnnNs+W33\n7rFmftUJ5UXfnnralcOfuK/ybsmCj0IIG+b/9gTrBvlZIz+aE3qGEML780uTrw/sdsv40mQy\nq/5qex56yrH/2KTqzIkTJ/70009Vd9dff/1EIlEju62+zMzMZZ+0smVn1+bz1BkZtfDGndrd\ncvrV+n7T/1eu9S2n/98qtpx+q+aWS0tL07ASVn1pCrvnr7lg9ub9em/RLFn+2zW5ohlPPf7l\nnMv/c1rH+tkhhLbrdyx/q+fDt3+6x6Vb/dk4FcULQghNs377r0Wz7Myy+UUhhPKSyfMzs9dp\ntt3VQy8pTM5767m7rx1yfm67+3t1KKw8c/jw4ffff3/VA8eMGZObm7uyN/pX0qhRo9peQrot\nccvF6V9HuvgT1wW2XBeksuXp06enYSWs+tIRdlPfHHTP5y0G37vz747P/+G9ZDJ53iH/8+Rs\n/bLJIWwVkuVFxaUhhLKi4hBCUVFR5U8TOfVCCLPKKgp+vcQ1o7Q8szAnhJCZs9Yjjzzy6zC5\nO3Y/68uR417+9ye9rtuhpjYGALAqSUfYTXvto5J5Px590AFVR57te8gL9Tf996V5icz6wx66\nZ/GTExnZIYSF0x7q0buq0kK3bt0qb1x153EhjP5iUVmr3F/C7qtFZY12KFzivJ2a13tx5rSq\nu8cee2yvXr2q7i5YsGD+/PkruLWVpX795f7wl+U3Y8aM9E9aZdXZckH615EutfsnDiE0aNAg\nzTPacvo1bNgwzTPaMixFOsKu7RHn3XDgL8/9Jyvmnn7GgO37X37w6k3zm00JFW+PnFl+wJqV\n/41P3n3BObN3OPm0PdfKX/2wESMOCyGULRrftedvr7ELyZI1c4b89/Wpu3VpFUIoXfDB2/NK\n/rlbixDC7C8HnX7NZ5ffdkuLnMonaitenbKwcPP1q5aRm5u7+HOvM2bMSCZXlbdY1MpKVp3t\np01d23Kt7zf9C6j1LaefLdcFdXDLLLd0hF1e89brNf/lduVr7Apbt2nTon4Ia/berOl9Z1+W\n17drh7UKPnjh7qc/n3HR2asvbaxEzhldO5x574AX1zhro8alIwZdn7/Grke0LAghNGzTvenC\n484ecMeJh+5SmFg07oUHRy9ocGHv9Zc2GgBARNL9zRO/0+XCG4vvvPXRwVfPKs1u2WaT067s\nv1nBMt77s173y04ovunhGy+cUZRou2nnyy7pU3mBLiOr2aWDLr5n8NCBl51flNmgTbuOZ904\noNOyRgMAiEa6wy6R2XjEiBGL3W3U9fj+XY//0/Oz6nX47XnYXx+z+5Gn737kEk7ObbzRcede\ncdzKWisAwF9KLXyWGAAANUHYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEolphV/HjhK8q\nbxVNfeeiM/ud3P+qFybMq4llAQBQXVkpnlcyZ+yhO3YZ8U2LkgWfJstm7b9h5/+bsSiEcPsN\nd9z7xcc91y6oyUUCALBsqV6xe/iAg5/8rOTI004KIUwdd+r/zVjU77kvZ3372ubZU87o/khN\nrhAAgJSkGnZXvD219X7Dhlx6XAjho8tG5zba8ea92xWus8PNh6034+MbanKFAACkJNWwm1hc\n1mzbVpW373t7WtNNTssMIYRQv039skXf1MzaAACohlTDbvuGuZOf/SCEUDz7hYemLdz83M0r\nj7/71A/Z+R1qanUAAKQs1TdPXNxr/R1uOuofvcdlvfVAIqvJFTutUVb09ZDrrz9lzE/Nd7m+\nRpcIAEAqUg27ba55ecDkva64Z2Bpot5RN7y+cf3s+ZOfOuH8wQUtd3zw0X/W6BIBAEhFqmGX\nkdX0wmHvnLdw+oLMJo1yM0IIeY33Hv78tjvvvm2jzERNrhAAgJSkGnaVvhn70kP/HTtx6syd\nrh7cI3tKYctNVB0AwCoi9bBL3nbUDv3ufaPyTv4FA/edP/DvnZ7ZqfctL97RL0vdAQDUtlTf\nFfvN0H/2u/eNXfvd9OFXkyuPNG53zRV9t311yIn7DR5fY8sDACBVqYbdZae/0GSDc1689ZRN\n1luz8khWfodzBo+5eOOmrw64tMaWBwBAqlINu8emL2rb69A/Hj/wiDZFM55eqUsCAGB5pBp2\n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\nu1fHf7WcCwEA/royckIIG591d9UFuSq5jVK9bPY7f8yirET45YPYUpgukVE/9bkqiitCCDmJ\nJafY46fvevCNr6zVaZd//H2bLtvvdfolm07uu/uJU387Yaez7pva69zhw58ZNfr1MS/c+58h\nN572r22Gf/LK7otdUKySrPifN0Ysc/BqWZnf9PrD99+txNEAgL+KvCb7ZCZOLZvdfs89t6s6\nWLZo/OMjPmyxaf7yjTnzk+Eh7F51t7z4u6dnFDXcdteamK7h+puH8MKYt6eH1g2rDr589vEP\nzGh8x437db/xlVb7DP7+mb5VP7pnsceWzv/ivU9nN910ix59z+jR94wQwufPX7rhPheecv77\nn92+beXaF5/r53dnVt0umffm0gevLl8pBgCsqKy89QZs2OSrB4586affXhz2UL/9DznkkInL\n2xrzp9x23rMTfr1X/p8z9p9fXrH/NdvXxHQNW5+7aUHOWyef8W3RLxFWMmfsETcPeebt1csW\nji9PJptstkXVyQt/fOP6yfNC+OXC24Kfb99mm226XfXbt3Cts+VWIYSyBWUhhPzMjKKZz07/\n9YWDRTPePOHlyVVnLnPw6lqZV+wAgDrr1OduG7J+z73bdjywx35btGvyycvDHnjhy417PXD4\n6st5xS53tbyr9tvwk55Hb9W2wfuvPPLkq9+12vPSQds2r4npEpmNnnrwhHYH3rzxep2POmzP\nFtmznxwy+Mfy+oMe65W/Wt5uTU945douJ2afsUXL/AmfvvnvwSPatsgrmfTewKGPHnNI10br\nXLzbane+dOlO+0w4apuN2lTM/m74v+/OzG464IpOIYT9Dl//4sve2XSXI846bJfSn8bfe8PN\nPzfLCT+UVc6bv1qPpQ9e3Y24YgcArAQFa3f76KNnjt5j7dFP3HXBpTe/M63JRUOef+/uw5Z7\nwK1vemPIBUdMev3JKy676fVvGxx9/pBPnu1f9SK4lT5d6/1v/Py523dtM+f+Wy699MZ7khv9\n477RXxy3fmHIyBv+/tOH7dJ6+C0XnXr+da9/WTHk3QnDH71g7QYlZx7Xb3ZZRSKz0YiPXzzx\n4B0+fX7opeedc8OQpwp3OPSxt784tGVBCKHTxaNuPe2QBpNeOvP43mcOuHb2xj3+75HOv826\nrMGru4tEMrmc1/r+qG297G8Wla6s0WrajBkzVuLeV1D9+vXz33ovzZNO67SbRGoAACAASURB\n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\nvD2vZPPdWoQQZn856Jje/X4qqfh1+IpXpyws3HD9NGwQAGBVkI4rdgunDv1sYelRG+ePe/fd\n3yaut95mG23Ze7Om9519WV7frh3WKvjghbuf/nzGRWevvrSxEjlndO1w5r0DXlzjrI0al44Y\ndH3+Grse0bIghNCwTfemC487e8AdJx66S2Fi0bgXHhy9oMGFvYUdAFBXpCPs5n39XQjhnqsv\nX/xgw1bnPThomy4X3lh8562PDr56Vml2yzabnHZl/80KlnFBfb3ul51QfNPDN144oyjRdtPO\nl13Sp/KqY0ZWs0sHXXzP4KEDLzu/KLNBm3Ydz7pxQKdljQYAEI10hF2LHS4fscOSf5TIbNT1\n+P5dj//Tx2bV61D1WSdVj9n9yNN3P3IJJ+c23ui4c684bgWWCgDw15WO19gBAJAGwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASWbW9gFrTsGHDZZ5TkYZ11J5GjRr98aAtx2SJ+w22HBdbrhTxfsOf/5UXN2fO\nnDSshFVf3Q270tLSZDK59HPi/u2UlJT88aAtx2SJ+w22HBdbrhTxfsOf/5Xhj+L+Z2FpFi1a\ntMywa5CepdSSRYsW/fGgLcdkifsNthwXW64U8X7Dn/+V4Y+8xg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBJZ6ZqoYtTDtz09+r1J8zI7dPxbr5OOapO/3FMvZaiVOAsAwF9Mmq7YTXj8/BuHjd3mn30u\nOvWIgm9e6v+vOypqYKiVOAsAwF9OWsIuWXLDsM/bHnLJwbttu9EWO55yzYkLfvzv0MkLVvJQ\nK3EWAIC/oHSEXfGc0ROLynfffa3Ku7mFO3QqyBk36qcQQrJs5mODrzr52KMO6tbzpHOvfmn8\nrN89Npks/u67SakMtZQfAQDUBel4CVrJgo9CCBvmZ1cd2SA/a+RHc0LP8MC5p45ctFHfPqe1\napgYP/bZgeccW37bvXusmV91ZnnRt6eeduXwJ+5b5lBL+VGl5557bvTo0VU/veCCC7Ky6vQr\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nNgAAgKuav8UuKSkpqVnLWgHsKTt1/5ypU77ccaZRmyfGPdrYqtOd/v1Hj8fz/CMP594sMueE\nSF3xuLIcThHJyXKISFZWlvenOnOEiKTmuKMMBu+aFKfLEGcWEYO51NKlSy+OsTRsP/jAqu3r\n3vml62sNvKtat259222XXtVnt9t9YzVhsVisVqvb7U5LS9NwbIHZbDaTyeR0OjMzM0OdRUQk\nJiZGp9NlZWXlfkI8VPR6vSYvHzl37pzvdDi8+zps84RVGCHP5eTOEwiz2azJHK3yaPUUgVZ5\noqOj9Xq9w+HQ9g8Q4ONvsfv4448D2U3a0bXPDnrLcGPzibM7V0668CBmjDTrDJFLFs3NvaVO\nbxKRzORFHXr4Wpq0a9fOe+Llt/uIbNxvzyljuVDsDtpzYhtc/phc7WIRa84k+xbLli1btmxZ\n32JKSoq2r0gwmS4cyHQ6nRqOLTDvpXO73eGTR6fTuVyucMhjuPiPQYByX5Zw+NsctnnCKoyQ\n53K0+sUMxi9XINxutyZztMrjfWQOk0dCKMnfb54IhMedOW7IdMvdT08f2cvX6kTEVqyZuDNX\nnXFZL7B8MO7FaV//KSK2op1Wrly5cuXK5Usm6o3xKy+qVqxJSbPhq29PeSc4M3Z+n5Z9c5Pi\nInL2wLTHe/T9M9v3O+zecDIzrtoNhXABAQAAwoG/R+zyPgodGxubx08zTy3ck+nsdqNt+7Zt\nl3YcUbFW9Vt61EqcP2SstVebKqWidq6e8+nelBeHFM0rh848qE2V5+aNWlNicPV458ppr9tK\n3N25dJSIxJRvn5jZZ8ioWf0ebRyns29f/f7GjOiRPSh2AADgWuFvsYuLy+stCHk/p5n26xER\nmfvKuNwrY8o8//6021qOnOR4+60PZ76S6jSVLl9z4IThtf71zox/qNh+7JOOyYsnjUzJ0lW4\nqdHY0T29Rx31xqQx016aO3PhlLEjsgzR5SvVGDxpVO0rTUNh0q3fFOCE5BqVNUkCAICS/C12\no0aN+tuyJ+fkoT0rlnxyRldq1IzxeZ+3eINxKxtc/kc6Q2ybJ4a3eeK/80VU8X3Wie88Tbs8\n27TLZTa2xFfvM2x8n7zTAAAAKMrfYvfiiy/+e+XkV7fefUOjyW9uH96to6apAAAAkG8BvXki\noli92aNrnf5p0oZzof8ACwAAgGtcoO+KtZW26XSGyjZeygYAABBiARU7tzN50gs7TVG1i5sK\n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\n4eSq/unjx8zZdFTHPKfL2/pWz9tH53gDuuQJBFy9bu06Zt2hkvt9zm0ZGRnTduaHN0z5eQr3\nz8/IyFh5zHkij3vfgB63vrA1N+x5ytvjVfr3GIkwFS2KfB599syoHjhidybc+dl7XP7OnU98\n86At+cq28dYNKw+W3Ew+/7bMSf969ulR0ZDH79rdqEmTm5uWfqOloW2SzZsX3veF5eUxmtPu\nvvvu9gknv87SYBYRuynsG2Hw31f+9vemLHONHd8z3DEqk2fTcXdK22S/8/jBw3mROaQQJIyn\nYN23BZ4bb2txcl3jiAlPDm6Tqlee02n+gucnvnNL5mM1zAad8mgBTUy2k1uvMc5gMATCfxyo\nvDyFu341GGOvSTnxqb3JWvfyRNuWpfvDnUfK2eNV8vcYmTAVLop8Hl32zKgmmGN3JjxFP4hI\nK/upz8ha2s3LfsiXfiIi1sR6zRPF74ncV8sHyWNNuuqFF64qvd9buGXe/sJGA8/TJY+lX7tu\n3S4UkdxNX288cGDjindrnp/xz1r2sIYJkkf6ScBzYPLYBTeOmt3Cbgp3jMrk+a7Qq62Z0Xvm\nFq+mmeNq3tD3oaEZ4b0MYZAwnuPfiEjtzZ+MWvjxjoPO2o2aden/wE0XhXcaUPA/rlI7339y\nR1r3ia1TwhomSB5Dv2YPXddg5vMz1z0+oElCYNWiZ62Jre9pkKBXnpgONbXAj98WeC5OsIqI\n5s/7rsBTsD0/3HmknD1eJX+PkQlT4aLI59Flz4xqgmJ3JgLuIhFJNZ861JRmMfkKXVGe57dv\nl8749zxv05syb6yvb55Da75ctn3fb785O/RoHNYkFeb5dNrYvHb3DXKkaf7cCCQJnsfv2Vdo\nsjROu/zpBZOStYKvl8575uUxthav3ZUexksoB3lx/O7jIvJ81uo+Q4fdXdv2S/bbs8YPc//n\n9W4Nwni+S2U25oDnwOS3fu0xY3z4YlQmT4d7Riz5v1FTR48QEYPB2HPshDRL2A8/l5cnsdGg\nCxPXTB8744GBXWoYC//37qwcX8AS8IQ7z9/NqVeeaBaxPTOqCYrdmTBaY0Uk1xeIN504zJPj\n9ZuSrUEfpGceT+7WeTNnfPrdsWt6DZvct2OMIbyfXlWYJ/3+x58RKd6/fuj9Uyae0+rJTvV0\nyXP4/16c/0udWa9eG9Znr3wek7Xe4sWLT65lu6rPY9uWbfhy7k93PRvG7zIJ8ssymk0ict34\n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\nKOL/A/mk2HoemwseAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualization the numbers of ride during the week days and month of the year per casual and membership riders\n",
    "\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual, day_of_week) %>%\n",
    "    summarise(number_of_rides=n(), .groups = 'drop') %>%\n",
    "    ggplot(aes(x = day_of_week, y = number_of_rides, fill = member_casual)) +\n",
    "    geom_bar(stat='identity', position ='dodge' )\n",
    "    \n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual, month) %>%\n",
    "    summarise(number_of_rides=n(), .groups = 'drop') %>%\n",
    "    ggplot(aes(x = month, y = number_of_rides, fill = member_casual)) +\n",
    "    geom_bar(stat='identity', position ='dodge' )"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "7d2fc872",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-31T09:20:09.041440Z",
     "iopub.status.busy": "2024-01-31T09:20:09.039649Z",
     "iopub.status.idle": "2024-01-31T09:20:10.410736Z",
     "shell.execute_reply": "2024-01-31T09:20:10.408705Z"
    },
    "papermill": {
     "duration": 1.39574,
     "end_time": "2024-01-31T09:20:10.413627",
     "exception": false,
     "start_time": "2024-01-31T09:20:09.017887",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd4Ccc/7A8e/2kk2yaUglIkQLcRxOiZYjBMch0SJItLjDqSdKhHN3WqIHd3qJ\nEv2Un+gkTosWRNQgSKRI3T6/P5a9INnMxs7M+u7r9c/NPDPzPJ/v3hpvz07JSiQSAQCAX7/s\nTA8AAEDjEHYAAJEQdgAAkRB2AACREHYAAJHITfPxbjz6kMJRYwd1KKq9+s2kEcP+/vbSdzjs\nhrv+0K4whBBCzTPjrnroudc/X5DTa4PfDvnToWsW59a7HQCgWUtnEiWmPf/v+2bM23epD1iZ\n98a8ona7Hzds/botq7fMq73w8fgzRt/52UHDjz2sTdV/rrlyxAkVt10zPHv52wEAmrk0hd3M\nSWNOvfyF2Qsrfrr93fml6/3ud79b/6cPSFRccud7Pfa/aN+deoQQ1roga9/BF9z25ZCDO+Ut\ne3vnFmlZBwBA05WmsCtdf98RowbUVH5z0qn/XHr7G/PL2/QprV4yf9aCmlVXKc36YXv5d89N\nL6s+ul/n2qsFpVv3KRnz2jNf77fbJ8vcfvCBPZZ53Pnz51dXV6doUSuhuLg4Ly+vsrJy8eLF\nmZ4lfQoKCgoLC2tqahYsWJDpWdInNze3RYsWIYT58+c3n48Bz8rKatWqVQhh0aJFVVVVmR4n\nfVq2bJmdnV1WVlZeXp7pWdLHE1qmZ/mpNm3aZHoEMi9NYZffqvNarUJ1ReFPtk9eWJl44bL9\nLn+/MpHIbdFh5wOOO3L33iGEikVvhRDWK86ru+e6xbmPvfVdxXbL3h4O/P7qrFmzPvnkk7pb\nu3fvnp+fn6pVNVz2UjI9S/rUrbfZrrpZhV3dqpvh/91W3Rw02Se0ysrKTI9Ak5DJtx1UV3y5\nMCdvjfa/++dto0oTC/77yPUXXndGQc+bh/QqrSlfFEJol/u/f2za5+VULSxb3va6q5MmTRo1\nalTd1VtvvbVXr17pWExD5OXltW7dOtNTpFt2dnYzXHUIofYMVnNTe7ayuSksLCws/Ol/vkbP\nE1oT8e2332Z6BJqETIZdTn7nu+6664drBdsMPOWDx1576l/vDLlo6+z8ohDC3Kqakpyc2ptn\nV1bnlOYvb3v6hwcAaGqa1geF9Fm1aMKcWSGEvBYbhvDc1CVVXQu+D7hpS6pab126vO11e9hl\nl1222267uqvV1dWzZ89O3wJWpGXLlvn5+RUVFU3wxRmpU1RUVFxcXFNTM3fu3EzPkj55eXm1\n5+rmzp1bU1OT6XHSJDs7u/ZVPvPnz29Wfxhq06ZNdnb24sWLlyxZkulZ0scTWqZngWXIZNjN\n++DKEy94929XXb5afu2fVmuenbG4dJO1QwiFpdt3yh/7+AszdxrQNYRQueiNlxdU7L3TaoWl\n3Za5vW6f+fn5S7+obt68eU3z5U1Nc6pUa7arbj4LX3qlzWfVS2uGq25Wv+F1mueq+VXI5Gs/\nW605sN3ib04dec0r70ydNuWNcWNOeW5RyyOGrh1CCFn5J+3T68MbR054bepXH79z/VkXF3fc\ncXCXkuVuBwBo9jJ5xi47t/25V55zw9jbLjvvjLKclmv23OCU0SP7lHz/jte1Bp53TPmYcaPP\nml2W1WOjvueNGpZd73YAgGYuK+6TyfPmzWtSH6bVqlWr2pekzJ8/P9OzpE9xcXHtS1LmzJmT\n6VnSJz8/v/Y1dnPmzGlWr7Fr27ZtCGH+/PkVFT/9QPKItW3btvY1ds3qE91qn9DKy8ub1Wvs\nap/Qqqurm+Br7Nq3b5/pEcg8Z7sAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIpGb6QGAlGt54ai0Hau8\n9n9GnJe2IwJQxxk7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI5GZ6\nAEiflheOSufhykMo+Odl6TwiAM2cM3YAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACRyM30AKlVXFycnd2E\n4jUnJyeEkJeXV1pamulZ0qf2/4Ls7OyMr7o6Ewdt1apVJg77I+lfeIsWLYqLi9N+2Iyp/SUv\nLCzMz8/P9CzpU/uElp+fn/F/tNOp6Tyh/cS8efMyPQJNQuRhV1lZmUgkMj3F/xQWFubm5lZX\nV5eVlWV6lvTJz8/Pz89PJBIZX3VeJg5aXl6e8V/C9C+8oqKiujojIZ0ZLVq0yMrKqqqqqqio\nyPQs6eMJLdOzwDLEH3ZVVVWZnuJ/av9rvqamplk9I2RnZzeR58FMhV1NTU0mjvw/6V94ZWVl\ns0qc4uLi2rDL+C95OtU+oTW3sGs6T2iwTE3oz5QAAPwSwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgErmZHoDM\naHnhqHQerjyEvL+PSecRAaAZcsYOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBI+oDitH9WbCKE8hKxzL0rbEQGA5sMZOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEjkZnoAABpNywtHpe1YiRDKQwij\nLkzbEYEVcsYOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASuZkeACAlWl44Km3Hqqz9n7P/kbYjAiyTM3YAAJEQdgAAkRB2\n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\nZLnbAQCavUz+KTY7t/25V55zw9jbLjvvjLKclmv23OCU0SP7lHz/jte1Bp53TPmYcaPPml2W\n1WOjvueNGpZd73YAgGYuw6+xK2iz/lF/Pf+oZd6WldPvkBP7HZL0dgCA5s3ZLgCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASORmeoDUysrKysrKyvQUGdY8fwJW3aw0z4VbdfOR\nzKoTiUQaJqHpizzsSkpKcnJy6r9PeXpGyZx27dr9fKNVR2mZqw7NdeFWHSWrXp5vv/02DZPQ\n9EUedosWLaqurq7/PsXpGSVz5s6d+/ONVh2lZa46NNeFW3WUrBrqF3nY1dTUrDDsotc8fwJW\n3aw0z4VbdfPRPFfNyvHmCQCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASORmeoCV\nUPPMuKseeu71zxfk9Nrgt0P+dOiaxb/GVQAANLJf3xm7j8efMfrOSVvsPezs4weXfPTkiBOu\nqcn0SAAATcGvLewSFZfc+V6P/Uftu9OW6/9mm+MuOHbRV4/f9uWiTI8FAJB5v7KwK//uuell\n1f36da69WlC6dZ+S/Nee+TqzUwEANAW/slenVSx6K4SwXnFe3ZZ1i3Mfe+u7cOD3V1999dV7\n7rmn7tajjz56tdVWS++MTU7Lli0zPUIGWHWz0jwXbtXNRzKrXrBgQRomoen7lYVdTfmiEEK7\n3P+daGyfl1O1sKzu6owZMyZMmFB3dciQIQUFBfXvs7yxh2xqlvkTsOooLe+3vXku3KqjZNXL\nI+yo9SsLu+z8ohDC3Kqakpyc2i2zK6tzSvPr7tCpU6eddtqp7mpRUVF5+Yr+kR91YeMPuhx5\neXmJ7OyamprKysq0HXTZP4E0rjonJyeRm5tIJCoqKtJ20IyvOjs7O5GXF0KoqKhIJBLpOehy\nf9vTtfCsrKz8/PxECJWVlTU16XtfU8b/787Pz09kZVVVVVVXV6ftoBlftSe0tB10xf8igx/8\nysIur8WGITw3dUlV14Lvw27akqrWW5fW3WHTTTfddNNN667OmzevSf1HTKtWrfLz86uqqprU\nVKlWXFycm5ubSCSa1arz8/Pz8vJCCAsXLkxn4mRWdnZ227ZtQwhLlixJ57/2Mq5t27ZZWVkV\nFRWLFy/O9CzpU/uEVllZ2az+0a59QqupqWlWq+ZX5Ff25onC0u075ec8/sLM2quVi954eUHF\nJjs191fRAQCEX13Yhaz8k/bp9eGNIye8NvWrj9+5/qyLizvuOLhLSabHAgDIvF/Zn2JDCGsN\nPO+Y8jHjRp81uyyrx0Z9zxs17NcWpwAAKfHrC7uQldPvkBP7HZLpMQAAmhhnuwAAIiHsgP9v\n774DmrjbOIA/l52wZchUBEXcUEf1de+t1OJALFQcbV1VRK2KVRxY6y5WK+7Volbrqtpq1YKj\nWou7QK24QGQPw05y7x/BSJHEqEgG389f3u8ud8/z3CU85kYAAMBIoLEDAAAAMBJo7AAAAACM\nBBo7AAAAACOBxg4AAADASKCxAwAAADASaOwAAAAAjAQaOwAAAAAjgcYOAAAAwEigsQMAAAAw\nEmjsAAAAAIwEGjsAAAAAI4HGDgAAAMBIoLEDAAAAMBJo7AAAAACMBBo7AAAAACOBxg4AAADA\nSKCxAwAAADASaOwAAAAAjAQaOwAAAAAjgcYOAAAAwEigsQMAAAAwEmjsAAAAAIwEGjsAAAAA\nI4HGDgAAAMBIoLEDAAAAMBJo7AAAAACMBMOyrK5jeIdycnJkMpmuo3ghJSXl2bNnZmZmDg4O\nuo6l+mRnZ6enp/P5/Hr16uk6lupTUFCQlJRERG5ubjweT9fhVBOZTJaYmEhEzs7OEolE1+FU\nn8TERJlMZmtra2VlpetYqs+TJ0+kUmlN+0DLysrKyMgQCASurq66jqUiGxsbXYcAumfkjZ2+\nmTFjxtmzZ7t27bp8+XJdx1J9tmzZsmHDBnt7+2PHjuk6lupz8eLFKVOmENGpU6dqzh/7rKys\nXr16EVFERES7du10HU716devX1pa2oQJE4KCgnQdS/UJDg6Ojo7u3r37smXLdB1L9YmMjIyM\njHR0dDxy5IiuYwGoBE7FAgAAABgJNHYAAAAARgKNHQAAAICRwDV2NoCqlQAAFatJREFU1erm\nzZtpaWl2dnbNmzfXdSzV5/79+/fu3ROJRB06dNB1LNUnMzPz2rVrRNSpUyeBQKDrcKpJSUlJ\n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\nFUz48VtBllvt2swf7hv5+NdJbxYwAIAB0PVXhgDwGp5eHk5EQ049Lj8YF/k/en4qtjjvEpdh\n6vTfWH6BrR61VKdiWZaN29iBiHYl3bXlc10HHdFmuwXp+4ioWfDl8oPZCbOJqNOuu8rJ1z0V\nKyt+bMrlNAu54m9n4j7sLMuyOYlziWjy9WgOw3TcmsCybGnhXS7DNBp/ofwLSwvioqKizqXk\na56rnGws4du/f0z578gBdYhozoWnWkYIAGBw0NgBGBJZYaKdgGvqOCReWqocKc653tlSpGrs\n8p9uIyKvuVdVL8l/cqGJCV9k2U01UpzzO5dhnPp7ElHY3WzttiwfYivhmzS9mFZ2m4KiNHNm\nK1uGIzydXaQced3GjmXZxe6WYpsPuAwz/FIKy7IKWU4tPsehZ0MiOpxZtqFFTax54vqnnzdq\nLMvuHO3BMMzO1PxXzmXL3xXLsiXPrtYV8cTWvTJL5doHCQBgQNDYARiYG98MJSKxbavx00JD\np43zshLV6xOkauxYeWEPazFXYD9xwYqtm9eHTguwF1u2r2fG4Vmu3b1PKlcoVxJSx5yIRJbd\ntG9wUv9YasrlCMwaj5s6Nzw0uHdjKyLqNvc31QJv0NjdWddWeergz+e35S51tyQisfUA1TLP\nHu6tI+TxJfWGBX2+bGnYRz0bE1Gzj3dpM5f9b2PHsmzcxoFE1HpujPZBAgAYEDR2AIbnjz1L\nunq7mQp5ZjYuH05c90z6N5W7K1b66HRgn/edrE3M7d269B919E5W+tWvXa0kAlPbpOKyZ6DE\nR3Ygohaz/3yt7T45v2dEzzbW5mKeyMz9va5h286Wn/sGjV1+6i4iUj2KhWXZG0tbEZFHYHT5\nxXISTn7i09ne0lQgqeXp1WH+phOlCm3nVmjsWEXJWHcLDs/8cGqB9nECABgKhmXf8MJnADBc\nV+d4tfnq5k/pBYOtRbqOBQAAqgwaO4AaR1Ga0c7aKd5qUu7DlbqOBQAAqhIedwJQs0yYPL3g\n7sErz0rGHAxWDT74aYB30AUNrxJadH764JCWm6jatQEAgPbwjR1AzdLEzuy+zMJ30pqdC311\nHQsAAFQxNHYAAAAARgI/KQYAAABgJNDYAQAAABgJNHYAAAAARgKNHQAAAICRQGMHAAAAYCTQ\n2AEAAAAYCTR2AAAAAEYCjR0AAACAkUBjBwAAAGAk/g9RQhLw67A15AAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdebzVc/7A8c/dl257IQmpSEgNBmNpLI2JhmFQGClKyAzGLktizNhTljCDsWbJ\nPpafIlt2jaUhUQmhtNft7vf3x+VOpNu5dU739On5fMzjMed8z/1+zvt8H7q9+p4to7q6OgAA\nsO7LbOgBAABIDmEHABAJYQcAEAlhBwAQCWEHABAJYQcAEAlhBwAQCWEHABCJ7IYeILUWLVpU\nWVmZ3DUbN26cmZlZUlJSWlqa3JVXT25ubkFBQQhh4cKFDT3L99LtEOXk5BQWFob0O0SlpaUl\nJSUNPUsIaXmIioqKsrKy0vAQLVq0KE0+1z3dDlF2dnajRo2CQ7RyqT5EzZs3T/qarHMiD7uq\nqqqkh11mZmZmZmZ1dXXSV1491dXVmZmZIYQ0mSeEkJGRkVYjZWdnp9U84YdDlD7/FaXhIar5\ngxbSZqTlD1GaVEu6/UHLyspyiOpWe4iqqqqqqqoaehzi5KlYAIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASGQ39ABAnBpfOXxNdq8IoSKE\nMOzyJI0DsF5wxg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEtkNPQCskxpfOXxNdq8IoSKEcNHfkzQOAIQg7ID1xxrmeGkIeZeP\nTNYwAKngqVgAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASPiAYoiET98F\nwBk7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEj4rliAhrGGX+9bGUJlCGHY5UkaB4iBM3YAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkYj8A4ozMjIyMjLWrZVXW/rMUztJmoyUbvPU8l9RItJtpHSbJ6TNSP6gJS4V\nI1VXVyd3QdZRkYddUVFRVlZWKlYuLCwsLCxMxcqrrWXLlg09wo/EfYhKk7FIQUFBQUFBMlYK\nIUkjOUSr1KJFi2QsE0JaHqKkSOIhSor8/Pz8/PyGnuJHmjdvnvQ1v/vuu6Svyboo8rBbunRp\nZWVlctds2rRpZmbmsmXLSkpKkrvy6snLy6vpp/nz5zf0LN9Lt0OUm5vbqFGjkNRDlJRiLSkp\nWbZsWTJWCiFJIzlEq7RgwYJknRpJw0O0JnJycoqKikJSD9Eaaty4cXZ2dmlpaXFxcUPPEkJa\nHiLiE3nYVVVVJT3sUr1yfVVVVdVcSJN5wg/PCFRXV6fJSGl4iGqkz39FtdJtnvT5r6hWZWVl\nWv2VnD6HqPbpkXQ7ROnzB632EFVVVdX+XoLk8uYJAIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEhkN/QAsGqNrxy+\nhiuUhpB3+cikDAMAacsZOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASGQ3\n9AAApIvGVw5fk91LQ8i7fGSyhgFWgzN2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkchey/d3x4nH5A8f3bd1wQ8bqiaMufGJl979\nYnFW521/2f9PA7YozF7VTXXsAgCw/lqbZ+yqp778j0dmLaiorq7dNG3s+dfe/9ouhwy66NR+\nRZ+NH3razVWruqmOXQAA1mdr6VzX7NdGnD3qlblLyn60tbrsmvs/6nDEVYft2yGE0PGKjMP6\nXXHPV/2PbttopTdtnLPSXQAA1m9r6Yxds20OGzr871ddfvbyG0sXvjSzpLJnz7Y1V/Oa7d69\nKPedCd/UcVMduwAArOfW0hm73CZtOzYJlWX5y28sW/p+CKFLYU7tlq0Ls595f2E4aqU3lf16\npbvUGDdu3KhRo2pvveqqq7bYYovkPpbMzMwQQkFBQX5+/ip/eC3IyMioudC8efOGnaRWVlZW\nCCE/Pz8vLy8pC1YkZZWkHqKkjFRQUJCsQxSSNFK6HaL8/Pzc3NxkrBRCkkZq1qxZMpYJwSFK\nvZpf18k9RGui9td106ZNk774/Pnzk74m66KGfNtBVenSEELL7P+dNWyVk1WxpKSOm+rYpUZx\ncfFXX31Ve7WysrImMpKu5vdFWknRI11tSTxEyQq7JB6ipIyUkZGRbiOl2zwO0SrFfYiSIrmH\nKCnSbR5i0pBhl5lbEEKYX1FV9MN/4nPLK7Oa5dZxUx271OjYseMxxxxTe7WoqGjZsmXJHTs/\nPz8jI6O8vLyiIlm9sUaysrJq/jGa9Ee62pJ+iJJViEk8REkZqaKiory8PBkrhZCkkRyiVXKI\nVqmkpKR6uTfJNaC8vLzMzMzkHqI1UfvrOn0OEfFpyLDLabRdCC9NWVbRLu/7Spu6rKLp7s3q\nuKmOXWp06dKlS5cutVcXLFiwdOnS5I6dl5eXkZFRVlaWJiFV+yxD0h/pasvNzc3KyiovLy8u\nLk7Kgo2TskpSD1FSRiorK0vWIQpJGindDlF5eXm6jVRcXJysv5JjPURLly5Nk2rJycnJzMxM\n7iFaE7m5uTW/rouLi6uqfKIDKdGQzyfmN9tr49ysZ1+ZXXO1fOl/3lxc9ot9N6rjpjp2AQBY\nzzXoC8Uycs84tPOndwwb986Ur6d9eNuFVxe22affJkV13VTHLgAA67cG/s6Gjn0uPal0xJhr\nL5xbktFh+x6XDh+Uuaqb6tgFAGB9tlbDLit3k8cff/xHmzKyeh5zes9jfu6nV3ZTHbsAAKzH\nnO0CAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiER2Qw9AaHzl8DVcoTSEvMtHJmUYgPSx\nhr8eK0OoDCEMuzxJ48A6wBk7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBIZDf0AKSjxlcOX5PdK0KoCCFc9PckjQMAJMQZOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEhkN/QAALDOaHzl8DXZvTSEvMtHJmsYWJEzdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJHIrtdPL/pm5pyl5Stu79ChQ5LmAQBgNSUadsvmjDusxxH//ui7\nn721uro6eSMBALA6Eg27Ww48+qmP5+9/wlm/2WbT7IyUjgQAwOpINOz++s6c9oeO/fdNB6V0\nGgAAVluib57IyQybH7V9SkcBAGBNJBp2523favpdk1I6CgAAayLRsDvuqXs3fPGYQVc9OLu4\nIqUDAQCweup6jV379u2Xv1oRyl8/8/B/npXVok3bxrk/KsLp06enZDoAABJWV9h169btJ1t2\nTOUoAACsibrC7pFHHllrcwAAsIYSfY3drrvuetWXS1bc/s3EP++x99FJHQkAgNWxis+xWzT9\n06/LKkMIr7/++hYffTRlaZMf31794b9fmvjyjFRNBwBAwlYRdmN/u/Oxn8yruXzvb35578/9\nTJPNhyR7KgAA6m0VYfer4deMXlASQjjhhBN6XHLtEa0LfvIDmTmNd/3DoamaDgCAhK0i7Lbq\nc8xWIYQQxowZ8/tjBw7euGgtzAQAwGpI9Ltin3zyyRDC0qVLf7p/Tl5ebqKLAACQOok2WVHR\nSs/VZWYXtm3fYece+w0+fei+nZslaTAAAOon0bAbfdPIW845c9Li6m6/3m+nrdsXZJTPnPLW\nU+Pfadzt0CN/1fLrmZ+8fPeIh+/4x+iPZgzq2DSlE6+5xlcOX5Pdy2v+78K/JWMWAICkSTTs\ndpr74MmlG9337tt9tm9Vu3HeBw/ttMsxRZd98sB+bcsWTfljlx2HHn7PoHdPSs2oAADUJdEP\nKD71yjc7HHX38lUXQmix3aF3H7PZiKP/EkLIbbLVFTf8csHH1yV/RgAAEpBo2E0uLi9s12jF\n7Y02bVQy//9qLhe0bVRZNitpowEAUB+Jht1xbYum3HDxF6WVy2+sKps1fMRHRRv3r7n69KUf\n5LfYP7nzAQCQoERfY3f2IxfdtOOZXTrtceIJfXfsvFleKP18yrsP3HzDa3Ozrn7r/NKFLxxy\nwMCnXp3xu9FPp3RcAABWJtGwa9ntL1NeaDHg5POuHHpK7cZmnfa4+fkxA7u1XPr1f1/+LPeE\nvz980+DOqZkTAIBVqMdnC2+8R/9n3+v/9dRJ//n48+LK7I3ab71z1w7ZGSGE0KjNSYu+9o2x\nAAANqd5fGtGmU/c2nbqvsDkjKdMAALDa6hd2876cNmdp+Yrbt9pqqyTNA/C9/F59whvvruEi\nc7b12wlYjyQadiXfjfvD7n2emjLvZ2+trq5O3kgA6Si/V58w4dU1XERoAimVaNjdctDRT09d\n3PvEc37bdfNsz7sCAKSfRMPu0rfmbNHn4SduPDCl0wAAsNoS+oDi6srFc8orN+vTNdXTAACw\n2hIKu4ysol83y592x9upngYAgNWW4FeKZYx58pKyp//Y/5J/fbu0IrUTAQCwWhJ9jd2h5zy2\nYZucf13Y/86Ljmux0UYFWT96A8UXX3yRgtkAAKiHRMOuVatWrVrtu1m3lA4DAMDqSzTsHnnk\nkZTOAQDAGqrfN09MGX//fc++NnP2vD0vH903Z+Ibs7r22HaDFE0GAEC9JB521TcO2H3IHRNr\nrhReMPKAJSP36v7kngNHjbt5iI8shnWdr1UAiECC74oNn91zyJA7Ju4zZMR7U7+q2dK80xWX\nHb/ri7eefODoj1M2HgAAiUo07C49/bkWW58z7vpTunbcuGZLdmHnc0a/evF2LV8cdknKxgMA\nIFGJht1D3y3r0P/IFbcf3G+LkrlPJHUkAABWR6Jht2le1uKpi1bcPn/ywqy8jZM6EgAAqyPR\nsDtv5w0+vbvf69+VLL+xeNbzA+6f1qr72SkYDACA+kk07A65/5ZNM2b2aN9t8BnDQwiTx9x2\nyZn9u3Tab2ZVm1EPHp7KCQEASEiiH3dS0Hr/Se89fsLg0/9xzbAQwoTzT38xI2ubvQ5/5Pob\ne7dplMIBAViJ/F59whvvruEiPqQGYpLoGbsQQpNOve59/r9Lvv3srddeee3Nd2bOW/rB+Ht7\nb90sdcMBAOunwqzMTke81NBTNLxrOzQvbNk78Z+v3zdPhBAKWrffsXX7+u4F/ER+rz7hzUlr\nuIhzLQAsr95ht27Jzc3NyclJxcopWnZNFBQUNPQIP5KdnZ1uI6XbPGsu3R5Rus0T0m+kdJsn\npGCkgoKC6urq5K65JtLwd1F+fn7SD9GyZcuSuyDrqLrCrlOnTgmuMnXq1GQMk3zZ2dkZGT/9\nvrOqZKyclZW14sqrJynzhBByc3OTtJJDtGrJGmkNLf+I0mGkdJsnpN9I6TZPSMFISfx3b7J+\nF6Xbn/1UnBpIbdhVl5VW5uQl8ftDk75gnaoqFlRnN8taO3fW0OoKu80333xtjZEqxcXFFRUV\nP9nYOBkrl5SUJOtPUVLmCSEsXLgwSSslZ6TS0tLi4uJkrBTtIVpzyz+idBgp3eYJ6TdSus0T\nUjDSokWLknU6Klm/i5YuXZqMlUJI0kiLFy+uqkqTsK/LmK1bDS4+adzQJQefcf2sJRVNWm3e\ne+CwOy/r9+4dZw8adsfHXy/dqMM2x1xw+7AjutTusuTzl84/+68Pj3/j2+LM9lt2O+KEMy4Y\nvH/mGiz4/kN/+9PFo9+e8k1B6/Y9Dx101ZWnts3NSuTubt+q5V8qzv/mnd2O+33/h1/++Ouy\nyqZZq+7Ir1+955Rh145//cNlmY27/uo3pw8fcdhOrWtu+ujxG8695p+vTJqyYFlV63adfvOH\ngdde9qcWP7RpVfl3N11w1s0PPvXJzLm5TTbaad+D/3rDFbu0yg8hnNWuyehwwqIvrqi9l/9c\nvEP3Ye9OL6nYPC8rkcXrpa6we+655+q1Vo/OnV78OE1P3QEA9VU8+57dT55/1KkX7Nwu7/Eb\n/3bP346ZMu2fk8cX/+Uv5/ernH7dX0cNP3rHfQ9YsHuT3BDC0lmPdtv68JkZbY8aMKhjq6z3\nJjw47IQDHp14+6R/9V+9Bee8e+EvHpi472HHnH5Q4/defGjMyDPGvTR15jujCzJDIndXVTHv\n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\n586df3K/pSl6PPXUtGnTmgvpNk9Iv5HSbZ5gpJVIt3lC+o2UbvOE9Bsp3eYJ6TfS8vPU+u67\n79b+JKShhgy7rNy2DzzwwA/X8vboc9Ynz7zz/D8+7H/V7pm5BSGE+RVVRVlZNTfPLa/Mapa7\nsu1rf3gAgHSTXh8U0n3DgnHz5oQQchptF8JLU5ZVtMv7PuCmLqtounuzlW2vXWHffffdYYcd\naq/m5+fPnz//J/dSmNoHkajawdJtnpB+I6XbPMFIK5Fu84T0Gynd5gnpN1K6zRPSb6QV/16D\nWg355okFn9xw3MAh35RV/bCh6sVZxc26bBlCyG+218a5Wc++MrvmhvKl/3lzcdkv9t1oZdtr\n1ywsLGy7nKysrMoVrM3HWIe0nScNR2roQb6XzocoTUZKt3lC+o2UbvOE9Bsp3eYJ6TfSin+v\npclgpIOGDLsmW/RpWfzt2cNufuvDKVMn/2fMiLNeWtr4+IFbhhBCRu4Zh3b+9I5h496Z8vW0\nD2+78OrCNvv026RopdsBANZ7DflUbGZ2q0tuuPj20feMvPT8kqzGW3Ta9qxrh3Uv+v7NPh37\nXHpS6Ygx1144tySjw/Y9Lh0+KLPO7QAA67kGfo1dXvNtTjj3shN+9raMrJ7HnN7zmIS3AwCs\n35ztAgCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiER2Qw+QWo0aNcrM/Gm8VjTIKCto3rx5zYV0myek30jp\nNk8w0kqk2zwh/UZKt3lC+o2UbvOE9Btp+XlqzZ8/f+1PQhqKPOxKS0urq6t/sjG3QUZZQXFx\ncc2FdJsnpN9I6TZPMNJKpNs8If1GSrd5QvqNlG7zhPQbafl54CciD7uKioqKip/++yod/liG\nEEpLS2supNs8If1GSrd5gpFWIt3mCek3UrrNE9JvpHSbJ6TfSMvPAz/hNXYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkchu6AFWQ9WEMTc+8dK7XyzO6rztL/v/acAWheviowAASLJ174zdtLHnX3v/a7scMuii\nU/sVfTZ+6Gk3VzX0SAAA6WBdC7vqsmvu/6jDEcMP23fXbXbY45QrTl769bP3fLW0occCAGh4\n61jYlS58aWZJZc+ebWuu5jXbvXtR7jsTvmnYqQAA0sE69uq0sqXvhxC6FObUbtm6MPuZ9xeG\no76/+vbbbz/00EO1t5544okbbbTR2p0xUY0bN27oEX4k3eYJ6TdSus0T0m+kdJsnpN9I6TZP\nSL+R0m2ekH4j/ew8ixcvXvuTkIbWsbCrKl0aQmiZ/b8Tja1ysiqWlNRenTVr1rhx42qv9u/f\nPy8v7yeLlKZ4yATVDpZu84T0Gynd5glGWol0myek30jpNk9Iv5HSbZ6QfiOt+PdaEHb8IKO6\nurqhZ6iHxV9eddRJL93w4CPt8rJqttw/sO9Tzc7411U71lxdC2fscnNzMzIyKioqKisrk7vy\n6snKysrOzg4hlJamwy+cEByiBNQcosrKyoqKioaeJYQQMjMzc3JygkO0cg7RKjlEq1R7iMrK\nypL+l+/ixYtbtWqV3DVZF61jZ+xyGm0XwktTllXUht3UZRVNd29W+wM77rjjjjvuWHt1wYIF\nSf9HTIsWLTIyMkpLS5ctW5bclVdPfn5+UVFRSKd/rjVv3jwrK6usrKy4uLihZwkhhLy8vJpn\nLtLtEJWWlqbPIar5+ybdDlFZWdnSpWnx7qjaQ7RkyZI0+fdws2bNsrOz0+cQ5ebmOkR1W/4Q\nVVX5RAdSYh1780R+s702zs169pXZNVfLl/7nzcVlv9g3TV9FBwCwNq1jYRcycs84tPOndwwb\n986Ur6d9eNuFVxe22affJkUNPRYAQMNbx56KDSF07HPpSaUjxlx74dySjA7b97h0+KB1LU4B\nAFJi3Qu7kJHV85jTex7T0GMAAKQZZ7sAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACKR\nUV1d3dAzpNCCBQsqKiqSu+a0adMqKipat27dvHnz5K68ehYtWvTNN9+EELbccsuGnuV706dP\nLy8vd4jq8Pnnn5eWlrZq1apFixYNPUsIISxZsmTWrFkhhI4dO2ZmpsW/92bMmFFWVvb/7d1p\nQBPX3gbwfxKSQNgNuCMYoIC1Wk3r1rqhXvVqFHAXBfe9dX2FFlTUF71SK1ZuEVes1qVWa7Xu\nFiuocPW6b3WtdWURBFmSkJDM/ZCA1pqA1szQ8Pw+MTMnw+PJePhncmZGKpVKpVKusxC90EW+\nvr48Ho/rOETlR1GtWrXc3Ny4zkJULY+iBw8eqFQqV1dXd3d3rrMQESmVyocPHxKRTCazsbF5\n6/uvJkcCcIyB19SzZ0+5XL5+/Xqugxjt3r1bLpe3atWK6yDPKRQKuVy+evVqroMY7du3Ty6X\ny+VyvV7PdRaj4OBguVy+cuVKroMYHTp0yNBFGo2G6yxGAwYMkMvlCQkJXAcxSklJMXSRUqnk\nOovRkCFD5HJ5fHw810GMUlNTDV1UWFjIdRaj4cOHy+XyuLg4roMYnTx50tBFT58+5ToLWK1q\n8aEKAAAAAP46FHYAAAAAVgKFHQAAAICVsPKLJyzh+PHjpaWlPj4+Xl5eXGchInr8+PG1a9d4\nPF6XLl24zmJ08uRJlUolk8lkMhnXWYiIMjMzr169SkRdu3blOotRenq6UqmsPl2UnZ19+fJl\nIgoMDKwm094zMjJKSkq8vLx8fHy4zkJElJOTc+nSJSLq3LmzQCDgOg4R0alTp4qKiho1alRN\nrgp68uTJxYsXiahTp06WuDLgDZw+fbqwsNDDw8PPz4/rLEREeXl558+fJ6IOHTqIRCKu44B1\nQmEHAAAAYCWqxUdzAAAAAPjrUNhBDaUuyFfqcboaAACsSrWYBlG96Y9tS/wp7dyDIoF/01Yj\nPhkpk7zcaRsmhtsuSBrsbsdtJKYsf9eaVQfSL+ap+fU8fPsMn9C9RV0O8xCRpvDm2hXr0i/f\nUQvsGzVu0m/c5I88HbiNZKDOyxg95l8dVm4ZX9ee2zzZGVFjF19+semo5O1BUlsOI909uWPz\n/vRrNx45N/QLHj3tH++xcwvlV+cpevRl6MTUl5qK7Jvv2LqQq0hM0idO8gAADTlJREFUWf5P\nyUkHMq4+UQk8vZsOGD+pjQfHR5GuNHPryjUnL93IKSaf5u3HTB3t6yBkJZLRn8bAyodNdvNU\naRObkbgbrsH64YxdJX7bGR3/XUabkLHzpoU53EmJmr5K/4ftzK3ja3c9LihjcaqiqUiHF83a\nnJrdZ+SnSxZGBHqXJsZM/vFBMYd5iJjEGXPTc+tOjo5dHDXVX3B96ayIXK3e7M4sHYmIiNGr\nEiO/KtJx/5YRUcGFAjupIvIFHzqy8SfZVKTcs+unxW2RfvjP6Ni53QPUiTEzLiu1HOaR1PpD\n50RGRnaqLXFv1Y3DSCmLZn2Tktd37KxFUZ/68a8tmRmZw+1RzeiSZszce40GT/psUdTUBoUZ\n0dOWadg7ul8xBlY2bLKdpwqb2I7E1XANNQLXd0iu3vSlkwcETf/utmFJnX9coVBsfFhsWMxO\njx8xpJ9CoVAoFJuyS7iNVKa+H9SnT/yViruZ6xPCBoRHZnCVh2EYdUGKQqE4WqA2bNKWXFUo\nFP9+VMRhJIOz66YPm7lSoVAkZRab2AV7edKmDBsXd4WNGFWLNH9ov0lJl8rb6eLnRa++kMth\nnpcU3Njab3BkntbyTxAxEUmvV/fv2yc6I9uwvkx1U6FQxP32jKs8DMMUP05WKBTHnqqMkUof\nhYf0XX4j3+KRTI2BVX43WcpT2Sb2I3E2XEPNgDN25pQ+S7uv1nXr1sCwKHb5uIWD6OyxLMOi\ny7sDohb8a+mSiOoQSaf+3bNx43/KnMob8lo4i7UFFv8IaKaL+DZuo0aNau1Yfkk/z4aIJAKL\nH3Lm37Vnt39YdFA9Z14/S8eoYp4LhaWuLVx0qsKsnALWTiOYiqQpyjhTpOkxwLe8IX9azMKx\nzS3+qFbzXVSB0RUtm7+jV9TsWjYWf1Sr6UiMniGBuPww5tvzeDy95c8Amemi4ru3eHy7jq7G\nr+8FovrtnMTX9z+2dCQyMQZW8d1kLU+lm9iPxNVwDTUE5tiZoym5RERNJM+/GguQ2By89IxC\niYhETg18nEinYWE6VOWRRKHtly9vX7FSW3x9/eNiz5EWv3WTmS4S2jcLCmpGRPkXTp3LzDyX\nstP9XcXw2hIOI+k1mbFzNveIWOUrYe8+ZOaPovPFWubEioEJ17UMY2Pv3n3o1PGKZlxF0nT6\nLxHVubovYtveO1mqOp7evcM+6fm+xaf+mO+iCr/tWnjHLXh+U1dL5zETiRfqPbWzR8KyhIzP\nwhs76lO/Wypyajraw5GrPBRKtnXdGf3lM0WaDxxFRMToCs4XaYpuP7N0JDIxBlbx3WQtT6Wb\n2I8kcuZmuIYaAoWdOfrSEiKS2jw/yeQmFJQVq7lLVKVI987sX/HVeq2sZ1SPhtUhT/aJowdv\nP7p3T9U2xMvSecxHOhA3p6Dl5DFyN0aXz0KSSvPoNI+KBUIvt3ZLNi9wYYpO7V//xZpose/G\nEf4unETSlRYS0bLE44PGTxxVR/xr2vdJ8yaW/ntTkIdlL3mpylGk12TGbr0VsmKeRZNUJVLb\n0dP2/CdiceQ0IuLx+P3mxLgJLX4e2kweJ88xzZxOxM9Z8cnI3rX4xb/sTMor0wv1GktHeoOo\n8GdsDtdQQ6CwM4cvsiOi/DK9Q/mN5vO0OoELl7cLNx9Jk39jfcKKA+efduw/MXZooC3P4t9Y\nVaWL/Kd89gWR8vHp8VMWza/XZGHXBpxEyvnP18m/1k3a0Mmiv73qeYhIIGqwffv28obi9oNm\n3zx49ujaKyOWfsxJJL6NgIg6z5sX7O9KRH4BzTPTB/6YeCVocRtO8rzY5sH+ZcUOgSEN2Ln+\n1GQknSYzakJkabvQlaHdakv0107uXhg7Rbh47RAL1+JmuogncJiTELM6YdOquOgSxrlt3zGD\nH63YLWGpo14rKryI/eEaagjMsTNHaP8eEd1QlVWsuaUqc25q2RHcPDORiu6lTBkXeZGax61J\nnhHahZ1hwkyewtvH9x06XbFeUr+Vopbt/UMWn2pjKtKT45c0RZdG9Qvq06dP3+BwIto3bkj/\nIXO4yvPKxi3q2GkLn3AVyUbiS0QdPZ9/sdi6nqQ01+KztarQRcw339/1CQ2xdJJKIz29vPJG\nCX/R5OAGUkehnXPzrmGTGtntTThtek+WzWP4Weza9JO5S5I379i+Zd30QW2vKLWucnZuUvMK\n1XDYrIY4Ga6hhkBhZ46tS+f6IsGhEzmGRW3JhdNFmpZdubzbkKlIjF4ZG5Eo7vJp4txxfm7s\nzSMx00VaVerqpPjn9zdhdFeVZZJGFp9jZyqSd9jny8p9uTSGiD6Kio1bNJGrPERUcPPr0WMm\nZ2kq7gWhT32sdGli8ed+mopk69rd1YZ/5Gb59CxGd+yR0tHbm6s8FQ2UOd+fLdaO7sDefz1T\nkQRiMTHaZ7rnt+94qi4TiMVc5SEivSYrJiYmJd/4Xacq99CZIk2XbvUtHekNooIBV8M11BD4\nKtYsnmhWf///2xDzc73Z77pq93z9paRel7CG7Nxi9/UiKbPWXFNqR74nOXvmTEVbGzuf99+1\n8Adl013k6j/eWzQ+cvG6iSEdnAXqs4e/uaASzx5m+Wfem4jEJwefOsYmhjl2Lp4yGQs3KDbd\nRU6yQVLlhIiYVVOGBrrwVGePfJtW4jh3jOUf6G4iEo8oIsg3KnZuwykj36sjOn9wY1qxcPYE\nf67yVGx/vP+EyLGNty17l7yYjFR3vL/D+c+jEyYO/Ye7re7X9N2bsjTD41twloeIL6rrVXB7\nbVSC4+Qg2+KH2xPXun8wRsFhuVANh81qRpmzmZvhGmoGHsP2rRr/bhjdkY3LvztyOk/N827e\nccKMsT72f6iGdZqHwf0nDVy7bZjlr/c0EynrRNS4uMsvNXTy+Pzbry07O8pUHsMW5aMziau2\nnLt+v0zo2MjLv1fY+M5+rIxclb1rjC6/b3B4r9VbWXryhOk8pflXk5M2n7x4Sy1wlPk2DRo1\nrm0jVv4EmorElB3etGLnz6dzS0We3gG9wycF+jlzmYeIiNaNHJTuFbFuXks2klQWSVNwPXnV\nt+eu381TCRp6+nQbNK5XS1ZOR5nuIp36t+T4pLSLdzRC15Yd+kwYpXASsPfV3ivGwMr+A7Kd\npwqb2IzE5XANNQAKOwAAAAArgTl2AAAAAFYChR0AAACAlUBhBwAAAGAlUNgBAAAAWAkUdgAA\nAABWAoUdAAAAgJVAYQcAAABgJVDYAQD3tgW42bl25ToFAMDfHgo7AOBAzqlohUKRXqjhOggA\ngFVBYQcAHFBmZezduzdLq+M6CACAVUFhBwB/xGhKy97ikwYZtVb/9vYGAADmoLADACKibQFu\nzp5z/7t6RkNnBzuRwKW2bNjnG/VEZzZEtPCqYyd2aNykdczWay++JPvU9tCebd1dHET2zu98\n2HXBhmMv7S3zl8SWnq52IoG9tEHrHuE/PywxbF3U2KVx0FEi6ucmcfKYXfEqVVb6uD4fSZ0k\n9tIGrXuEHSlvDwAAVcRjmLf40RwA/q62BbgN/92Zr8sPnTa9tYd4T+Li/dcLPhjU4WqKcsaM\nMKnu7lexCfe1wrSnBR87iYjoyZmlPm0jVGKfoeFBMkfV8d2bfr5e0DX62JGFHQ17G5nVTKpK\nkw2cFNLOP/fSwbhVe4XSnoU5+wREd9OOHk+ZGb7gQvT2PZ1q+3Xp+M62ALewe9IP7e4Le48P\nbvfOk3MH4tbsE7r3Lsreg0+fAACvgQEAYJit/lIimpXyyLCoyttLRAJx/RP5asOa21sCiWjg\n1VyGYRhGP7C2RCgJSMssMWzVaZ/MbOHG49umPSut2FvrmGMV+981UEZEh8v3dvfHQCLamat8\n8be3nv+8/b5B3kSUWlBqyX80AIC1wYdhADASSvy/CKxv+Nm2Vi9HAd+t6fKPXMSGNe7t2hOR\nSqsnIlXuD9tzlH5jk9vXlRi28m3coraMYPTqeYceGtcIJLs+a1+x8+YDPYmoSGdyvh1PYLcj\n8uOKxXcUDYioWI/5eQAArwGFHQAY8W2kLy7a8Ejs7lqxyOMLK35W5x8kIllY4xfbO3iEEVHm\n4SzjyyVN64mejzA8G5753y5yaNlQJKh6ewAA+DMUdgDwBl4xN5fHsyEipvyKWh5P+Oc2ZvB4\ntn89FgBADYfCDgBem61rdyK6u/n3F1cWP9xERHW61OEkEgAAEAo7AHgDdm79Qtwl11eNznii\nNqxhyp4uDl3L44vn9vao+n5wUT4AwNtlw3UAAPg74q/8ac7hj6I6ecvDRwc3dlCl/pB86Fp+\nYFRKl/KLLcwTOgqJaHXC2tKAVkMHt7ZwWgCAmgJn7ADgTdRuHXkzdVNIG4cf1i+bu3TNbdv3\n5yf/kvL/gVV++ZLeLb3SYmfMWnzIojkBAGoU3KAYAAAAwErgjB0AAACAlUBhBwAAAGAlUNgB\nAAAAWAkUdgAAAABWAoUdAAAAgJVAYQcAAABgJVDYAQAAAFgJFHYAAAAAVgKFHQAAAICVQGEH\nAAAAYCVQ2AEAAABYCRR2AAAAAFYChR0AAACAlfgfCTXMuP8cxiIAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# visualization the avarage length of ride during the week days and month of the year per casual and membership riders\n",
    "\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual, day_of_week) %>%\n",
    "    summarise(average_ride_length = mean(ride_length), .groups = 'drop') %>%\n",
    "    ggplot(aes(x = day_of_week, y = average_ride_length, fill = member_casual)) +\n",
    "    geom_bar(stat='identity', position ='dodge' )\n",
    "\n",
    "tripdata_2023_v3 %>%\n",
    "    group_by(member_casual, month) %>%\n",
    "    summarise(average_ride_length = mean(ride_length), .groups = 'drop') %>%\n",
    "    ggplot(aes(x = month, y = average_ride_length, fill = member_casual)) +\n",
    "    geom_bar(stat='identity', position ='dodge' )\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f502ff9",
   "metadata": {
    "papermill": {
     "duration": 0.020308,
     "end_time": "2024-01-31T09:20:10.454631",
     "exception": false,
     "start_time": "2024-01-31T09:20:10.434323",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "according to visualization it seems that the casual riders use bike share less than the memebers but acctually they ride relatively longer distance rides that would indicate a more leisure oriented usage vs a more \"public transport\" or pragmatic use of the bikes by the annual members.\n",
    "Casual riders are more likely to return their bikes at the same station.\n",
    "Additionaly, while that membership riders are more active on weekday, casual riders use the service more often over weekend. It lead me to conclude that membership riders use this service for their commute while casual rider use it for fun.\n",
    "\n",
    "Conclusion:\n",
    "\n",
    "1)The Casual users have leisure, and tourism rides mostly on weekends and also the long distances.\n",
    "\n",
    "2)The Annual users have commute or pragmatic short rides during weekdays."
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 4374838,
     "sourceId": 7511371,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 347.548754,
   "end_time": "2024-01-31T09:20:11.000701",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-01-31T09:14:23.451947",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
