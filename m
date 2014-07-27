From: <doiggl@velocitynet.com.au>
Subject: Re: Deleting a 5 GB directory in Reiser4 hangs system(s)
Date: Sun, 27 Jul 2014 16:49:46 +1000
Message-ID: <f651f508fe39c0bf8484b2996012d16c@mail.velocitynet.com.au>
References: <CAM12Q5RGOuEMyVhTPcVcLDGAri6H9-NbBKOF2T_PXfq0=kMVoQ@mail.gmail.com> <CAM12Q5TqhZej_mehnmbvRx8vayd74HjBstEUewmXHKvbVXX=rQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5TqhZej_mehnmbvRx8vayd74HjBstEUewmXHKvbVXX=rQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jose R R <Jose.r.r@metztli-it.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello,
- Run following commands in another terminal while doing a rm command in
the other.
# iotop --only 
- also does # dmesg show any messages in another terminal
--Glenn

[1]
This command shows only show processes or threads actually doing I/O
# iotop --help

Usage: /usr/sbin/iotop [OPTIONS]

DISK READ and DISK WRITE are the block I/O bandwidth used during the
sampling
period. SWAPIN and IO are the percentages of time the thread spent
respectively
while swapping in and waiting on I/O more generally. PRIO is the I/O
priority at
which the thread is running (set using the ionice command).

Controls: left and right arrows to change the sorting column, r to invert
the
sorting order, o to toggle the --only option, p to toggle the --processes
option, a to toggle the --accumulated option, i to change I/O priority, q
to
quit, any other key to force a refresh.

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit
  -o, --only            only show processes or threads actually doing I/O
  -b, --batch           non-interactive mode
  -n NUM, --iter=NUM    number of iterations before ending [infinite]
  -d SEC, --delay=SEC   delay between iterations [1 second]
  -p PID, --pid=PID     processes/threads to monitor [all]
  -u USER, --user=USER  users to monitor [all]
  -P, --processes       only show processes, not all threads
  -a, --accumulated     show accumulated I/O instead of bandwidth
  -k, --kilobytes       use kilobytes instead of a human friendly unit
  -t, --time            add a timestamp on each line (implies --batch)
  -q, --quiet           suppress some lines of header (implies --batch)

