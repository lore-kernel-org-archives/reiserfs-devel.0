From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: starting with ".." could break stuff
Date: Fri, 2 Apr 2004 17:04:24 +0300
Message-ID: <20040402140424.GP5229@nysv.org>
References: <20040402035617.GC2158@zero>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040402035617.GC2158@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Tom Vier wrote:

>i bet there's a few apps that, when trying to skip .., only check the first
>two chars of the name. this may or may not be a problem.

Whatever its name is, the metas directory is invisible to readdir.
It's gratefully skipped every time.

>i'm not clear about how the metadata and plugins work. if you write to
>..meta/blah there has to be a plugin registered for that meta filename,

mjt@shrike:~/..metas$ touch foo
touch: cannot touch `foo': Permission denied
mjt@shrike:~/..metas$ cd plugin/
mjt@shrike:~/..metas/plugin$ touch foo
touch: cannot touch `foo': Permission denied

However, there may be big problems with someone mailing attachments
named ..metas/plugin/perm and so forth.
Also servers which blindly write data to the disk have to be secured.

>oes it keep the data in there ("..meta/blah") in some portian of the
>normal, linear file? or is ..meta/ the only way to get at it?

..metas/ is completely virtual.
It would be great to have some method of having the kernel, the fs,
or SOMETHING remember the changes.

Or do these changes to plugin settings still stay between reboots?
I'd like to hear Namesys' comment here, because I don't know.

-- 
mjt

