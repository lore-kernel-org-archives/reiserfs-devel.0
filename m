From: Ross Vandegrift <ross@willow.seitz.com>
Subject: Scrambled Files
Date: Tue, 23 Apr 2002 17:05:01 -0400
Message-ID: <20020423210501.GA28270@willow.seitz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello all,

	A drive crashed in a RAID1 array today, taking down an IDE bus
and locking the box it was in.  ReiserFS is installed on this array.
The box is a Debian woody machine, and was in the middle of running
dpkg.

	Files all over the system have been scrabled - replaced with
garbage text, other executables, sections of data files.  There doesn't
seem to be a pattern to the file corruption.  There are no messages in
the logs.

	Unfortunately, this is a pretty critical box and I need to start
restoring its functionality ASAP.  I don't really have time to debug the
problem.  I've extracted the filesystem metadata and put it up at
http://willow.seitz.com/~ross/metadata.bz2 if anyone thinks there would
be relevant information.

	The machine is an AMD-K6-2/500 with 168M of RAM.  It's running
2.4.17 over RAID1.  The operating system is Debian woody - other than
this disk failure, the machine has been rock solid.

Ross Vandegrift
ross@willow.seitz.com
