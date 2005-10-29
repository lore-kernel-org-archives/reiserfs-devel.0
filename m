From: David Masover <ninja@slaphack.com>
Subject: Re: COW files
Date: Sat, 29 Oct 2005 14:30:40 +0000
Message-ID: <43638790.9000500@slaphack.com>
References: <e692861c0510290101u55e5a3a5t898ad72768f8bd1a@mail.gmail.com> <43636C13.5040307@slaphack.com> <djvum7$6d7$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <djvum7$6d7$1@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Lexington Luthor <Lexington.Luthor@gmail.com>
Cc: reiserfs-list@namesys.com

Lexington Luthor wrote:
> David Masover wrote:
> 
>> Gregory Maxwell wrote:
>>
>>> Files could be COWed by a flag on the cp command (or really, perhaps
>>> that should be the default behavior) or with a utility (perhaps run as
>>> a periodic script to locate duplicates and COW them. This would
>>> greatly speed up the process of copying files.
>>
>>
>> Should be on the cp command, but you have to change the cp source for
>> that, and everything implementing "copy", including desktop managers.
>> There's currently no "copy" system call.  So it's more than just a
>> plugin.
>>
> 
> I would love something like this for entire directory trees. Perhaps
> with a reiser4 specific tool that does a COW cp -al.

Ok, are you talking about making all the files COW, or the directory
structure itself somehow COW?

Because if someone patched "cp" to do COW files, I'm sure it would also
work for "cp -a", which would be about as fast as "cp -al".

I'm not sure how it'd work to make entire directories COW -- that is,
"cp -a" is as fast as "ln" of a single file.


And before anyone from LKML gets any funny ideas, there's no reason why
COW should be Reiser4 specific.  We've been due a "copy" system call for
at least a decade.  Why not just add that, with the realization that
POSIX would be brain-dead not to add support for it later, then make it
COW for FS-es that support it, and a simple copy for FS-es that don't.

With any luck, not a line of any non-COW FS need be changed to support
the copy system call, unless they want to add COW support as well.

And if you think it's bad copying a couple of gigs around on a local
hard disk, wishing it could copy-on-write, try an NFS mount over a
(very) long-distance VPN.  Why should cp send a couple of gigs across a
network and back, when the machine running the "cp" command never needs
to see it?
