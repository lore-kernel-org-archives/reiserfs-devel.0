From: Narcoleptic Electron <narcoleptic_electron@yahoo.co.uk>
Subject: Re: More on Hard Links
Date: Tue, 9 Dec 2003 00:21:07 -0500 (EST)
Message-ID: <20031209052107.58404.qmail@web25009.mail.ukl.yahoo.com>
References: <5450026541-BeMail@cr593174-a>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16293-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5450026541-BeMail@cr593174-a>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


I've read through all the emails on the subject, and
here are my thoughts on how links should act, with a
very rough outline of how they could be implemented. 
I've also covered symlinks for good measure.  I'm not
an expert, and this is long, so please bear with me...

Note: I use the term "file" to refer to the underlying
file object (think 'inode'), and "directory entry" to
refer to the user-level reference to the underlying
file.

A. Symlinks:
============

Symlinks should be able to specify a file in any/all
of the following ways:

1. By location (i.e. path).  This is the way it works
now.
2. By file (i.e. volume id and file id).  File id is a
unique identifier for the file on the volume (eg.
inode number).  Not sure if there is a way to uniquely
identify a volume reliably...

In addition, the symlink file should specify the
look-up order (i.e. file first, then location, or vice
versa).

B. Hard links:
==============

About hard linking directories: I think it should be
allowed and possible.

About circularity: It should be possible to prevent
circularity at link creation time (as per Alex's
explanation of his BeOS system), and I think this
should happen.  I don't know of a case where the
utility of a circular link would outweigh the
confusion and mess it would create (including gc
requirements).

As far as types of hard links, I think they can be
boiled down to 3 basic use cases:

1. Linking to a file on the same ReiserX volume.
------------------------------------------------

Nothing new here: these can be implemented as regular
hard-links (i.e. pointers to an underlying
reference-counted file).

2. Linking to a file on a different ReiserX volume.
---------------------------------------------------

I think that there is a way that this can be done so
that hard link semantics are preserved (i.e. each
directory entry equally represents the file, at all
times -- even after unmounting of one of the volumes).

My idea: Each volume can contain a "synchronized" copy
of the underlying file.

Details:
- All underlying files (again, think 'inode' level)
contain a "sync list".  This contains the volume ID
and file ID of each file that it is synchronized with.
 If it is not synchronized with any files, the sync
list is empty.
- Synchronization is always two-way.  Thus, if two
files are synchronized, each refers to the other in
its sync list.
- Any time a transaction is to be committed to a
synchronized file, it is committed to all files in the
sync list, or none.  The latter case might occur if
one of the volumes is not mounted, for example, and
will return an error to the caller, possibly resulting
in a user message such as "This file is linked with
another file on an unavailable volume, and cannot be
modified until the volume becomes available.".
- When a file is copied, its sync list is not copied.
- For a file to be deleted, it must have a reference
count of 0 (no references to it on its own volume) and
not be synchronized with any other files (no items in
its sync list, meaning that no references to it exist
in other sync lists).  The sync list can only be
cleared once all the files in the sync list can be
resolved (i.e. all relevant volumes are mounted).  If
this resolution cannot be done right away, the file is
replaced with a "NULL" placeholder (leaving the sync
list unchanged) to save space (and reserve the File
ID) until the file can be deleted (i.e. next
transaction commit).

The principle of least privilege applies: if a file is
on a non-writable volume, no files synchronized with
it are modifiable.  Transaction commits are all or
nothing.

When creating a link on Volume A to a file on Volume B
(another ReiserX volume), the following would happen:
(i) If the target file doesn't already have a
non-"NULL" file synchronized to it on Volume A, a copy
of the underlying file on Volume B is created on
Volume A and they are synchronized.
(ii) A directory entry is created at the new link
location (on Volume A), which refers to the
synchronized file on Volume A.

If Volume B becomes unmounted, no transactions can be
committed to the synchronized file on Volume A until
Volume B is remounted.  However, the link can be
deleted (decrementing the reference count on the
synchronized Volume A file), or the file can be copied
and modified (note that the sync list is *not* copied
with the file).

If the link on Volume A is moved to Volume B, the
following happens:
(i) The original directory entry on Volume A is
deleted (decrementing the reference count on the
underlying synchronized file accordingly).
(ii) A new directory entry, referring to the
synchronized file on Volume B, is created at the drop
location on Volume B.

Because the "sync list" uses volume id and file id,
these references won't break if the links are moved
around.

3. Linking to a file on a different non-ReiserX
volume.
-------------------------------------------------------

Not possible (because "file synchronization"
management code would be unique to ReiserX).  User
either has to use a symlink or make a copy.



______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
