From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 01 Apr 2004 00:53:54 -0600
Message-ID: <406BBC82.20103@mrs.umn.edu>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
Reply-To: reiserfs-list@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

> Also I feel it should be on the file itself. ie for the file /tmp/fooblah
> you should be able to access the file's metadata by open()ing/using
> readdir() on /tmp/fooblah/metas or (/tmp/fooblah/..metas or whatever).
> 
That's how it works now I believe.

> Bad choice. Note the "lost+found" directory found on *all* Unix
> filesystems. If we need one more option | might be viable.

Actually lost+found would not conflict if the directory were just + 
i.e. file/+/uid. Unless someone is proposing changing syntax so that 
accessing a file like foo@uid would get an attribute out of it (or 
foo+uid I suppose).  VMS does something similar, having a different 
syntax for each possible physical condition of a file (i.e., which 
device somethings on, which version, etc.)...a nightmare much worse than 
DOS with its drive letters.

The basic format for all VMS filenames is:
device:[directory.path]filename.extension;version

Example:
DISK$1:[JOE.PUBLIC_HTML]INDEX.HTML;1

There is no reason why all this information needs to be part of the syntax.
