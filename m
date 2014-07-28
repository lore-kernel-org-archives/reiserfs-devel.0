From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Deleting a 5 GB directory in Reiser4 hangs system(s)
Date: Mon, 28 Jul 2014 10:45:03 -0700
Message-ID: <CAM12Q5RLQKTm15Sw4=NT0tUVq2LVbo90onGnq9fy6G1zhNd5fQ@mail.gmail.com>
References: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com>
	<CAM12Q5TqhZej_mehnmbvRx8vayd74HjBstEUewmXHKvbVXX=rQ@mail.gmail.com>
	<f651f508fe39c0bf8484b2996012d16c@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <f651f508fe39c0bf8484b2996012d16c@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze, doiggl-

On Sat, Jul 26, 2014 at 11:49 PM,  <doiggl@velocitynet.com.au> wrote:
> Hello,
> - Run following commands in another terminal while doing a rm command in
> the other.
> # iotop --only
> - also does # dmesg show any messages in another terminal
> --Glenn
>
> [1]
> This command shows only show processes or threads actually doing I/O
> # iotop --help
>
> Usage: /usr/sbin/iotop [OPTIONS]
>
> DISK READ and DISK WRITE are the block I/O bandwidth used during the
> sampling
> period. SWAPIN and IO are the percentages of time the thread spent
> respectively
> while swapping in and waiting on I/O more generally. PRIO is the I/O
> priority at
> which the thread is running (set using the ionice command).
>
> Controls: left and right arrows to change the sorting column, r to invert
> the
> sorting order, o to toggle the --only option, p to toggle the --processes
> option, a to toggle the --accumulated option, i to change I/O priority, q
> to
> quit, any other key to force a refresh.
>
> Options:
>   --version             show program's version number and exit
>   -h, --help            show this help message and exit
>   -o, --only            only show processes or threads actually doing I/O
>   -b, --batch           non-interactive mode
>   -n NUM, --iter=NUM    number of iterations before ending [infinite]
>   -d SEC, --delay=SEC   delay between iterations [1 second]
>   -p PID, --pid=PID     processes/threads to monitor [all]
>   -u USER, --user=USER  users to monitor [all]
>   -P, --processes       only show processes, not all threads
>   -a, --accumulated     show accumulated I/O instead of bandwidth
>   -k, --kilobytes       use kilobytes instead of a human friendly unit
>   -t, --time            add a timestamp on each line (implies --batch)
>   -q, --quiet           suppress some lines of header (implies --batch)
>

Example: Reiser4-formatted /dev/sda10 partition has old data that I
copied over with (cp -a) but which I now want to remove with (rm -rf).
From my current Debian system I mount /dev/sda10 to a local mount
point and do on one shell window:

nice rm -rf /mnt/sda10/copied-onto-reiser4-data-dir

on another shell I follow your suggestion:

iotop --only

(output)
----------------------------------------------------------
reiser4: sda10: found disk format 4.0.0.
reiser4: sda10: using Hybrid Transaction Model.
reiser4[rm(3352)]: parse_node40
(fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
WARNING: Wrong level found in node: 1 != 0
reiser4[rm(3352)]: delete_object_cryptcompress
(fs/reiser4/plugin/file/cryptcompress.c:3734)[edward-430]:
WARNING: cannot truncate cryptcompress file  425684: -5
reiser4[rm(3352)]: parse_node40
(fs/reiser4/plugin/node/node40.c:672)[nikita-494]:
WARNING: Wrong level found in node: 1 != 0
reiser4[rm(3352)]: reiser4_cut_tree_object
(fs/reiser4/tree.c:1790)[nikita-2861]:
WARNING: failure: -5
reiser4[rm(3352)]: delete_object_cryptcompress
(fs/reiser4/plugin/file/cryptcompress.c:3734)[edward-430]:
WARNING: cannot truncate cryptcompress file  425688: -5
-----------------------------------------------------------

and yet on another shell I execute:

dmesg

and I take a snapshot:

< https://pbs.twimg.com/media/Bto5EF0CYAAhwhQ.png:large >

waited 15 minutes but the process nice rm -rf hung -- and executing:

kill -9 <process id>

does not work either and the system fan strains with the unkillable process.

Odd? Yes I know, but it only occurs on old data copied over onto a
newly formatted reiser4 partition. There is no issue with new data
that I create (say 5GB or more) once my root Debian system is
operating on a Reiser4 file system.


Best Professional Regards.

-- 
Jose R R
http://www.metztli-it.com
---------------------------------------------------------------------------------------------
NEW Apache OpenOffice 4.1.0! Download for GNU/Linux, Mac OS, Windows.
---------------------------------------------------------------------------------------------
Daylight Saving Time in USA & Canada ends: Sunday, November 02, 2014
---------------------------------------------------------------------------------------------
