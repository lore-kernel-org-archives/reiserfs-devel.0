From: Kristian Koehntopp <kris@koehntopp.de>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 18:36:13 +0200
Message-ID: <20030428163613.GA23143@p15104972.pureserver.info>
References: <3EAD34D5.8030108@solidcode.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13876-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EAD34D5.8030108@solidcode.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erik Terpstra <erik@solidcode.net>
Cc: reiserfs-list@namesys.com

On Mon, Apr 28, 2003 at 04:04:05PM +0200, Erik Terpstra wrote:
> I am looking for a solution for the following problem:
>
> [ I need to touch only these arriving files that are already
>   complete ]

You should have a look at the "maildir" format for mail
directories as opposed to mbox. It is described in
http://cr.yp.to/proto/maildir.html.

Arriving mail has a problem very similar to yours, and DJB
proposes a solution to this by having multiple directories.
Essentially, DJB observes that the rename(2) system call is
atomic within the boundaries of a filesystem, while
open(2)/write(2)/close(2) sequences are not, and proposes
uploads of arriving new mails into a "tmp" directory, which is
parallel to a "new" directory:

.../foldername/tmp
              /new

New mail arrive in tmp, until they are completely transferred.
They are then moved into new with a single atomic rename(2)
call, guaranteeing that all files in new are complete. Also,
files that are being worked on can be moved into a third
parallel directoy in your system ("work"), thus making sure that
only one instance of a worker process can work on a certain
file, enabling parallelism in your application:

.../foldername/tmp/partial_file.tiff
               new/somefile_1.tiff
                  /somefile_2.tiff
               work/worker_<pid>.tiff
                    worker_<pid>.tiff

Thus, each worker process will move his current
new/somefile_<n>.tiff to work/worker_<pid>.tiff, and check if
that suceeds. If so, it is the only worker currently working on
that file, and can proceed. At the same time, any number of
workers may be active, without a chance of two workers running
into each other.


I once had a similar problem to yours, where I had to push and
pull batchfiles with Siemens HiCom data to a rather primitive
SVR4 that controlled the installation. Here, I was not allowed
to use directories, so I used trigger files named
"<original_name>.x" which were uploaded after the
"<original_name>" file. An uploaded "q" was complete when the
matching empty trigger file "q.x" showed up (which was due to
sorting always transmitted immediately after "q"). If there was
a "q.w" work indicator (containing the PID of the worker), any
"q" was being processed and thus untouchable.

This works with any filesystem that has atomic rename(2)
semantics.

Kristian
