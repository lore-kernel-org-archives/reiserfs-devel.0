From: Raul Miller <moth@debian.org>
Subject: Re: reiser4 non-free?
Date: Fri, 7 May 2004 14:18:12 -0400
Message-ID: <20040507141812.W13880@links.magenta.com>
References: <87fzag139k.fsf@aule.evenmere.org> <4099A868.9030406@slaphack.com> <20040506.083242.41632888.wlandry@ucsd.edu> <87k6zpy8ke.fsf@aule.evenmere.org> <20040506143643.GB25505@raptus.homelinux.org> <877jvpy08v.fsf@aule.evenmere.org> <877jvpy08v.fsf@aule.evenmere.org> <409A7F98.7040609@namesys.com> <E1BLnpD-0004fR-00@chiark.greenend.org.uk> <409A8B0B.2000603@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <409A8B0B.2000603@namesys.com>; from reiser@namesys.com on Thu, May 06, 2004 at 11:59:23AM -0700
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: debian-legal@lists.debian.org, reiserfs-list@namesys.com

On Thu, May 06, 2004 at 11:59:23AM -0700, Hans Reiser wrote:
> The kernel portion is GPL V2, this is the progs license.....

Does this mean that the reiser progs are merely aggregated with the
kernel, and that there is no functional relationship?

[Because the GPL does provide an explicit exception for that case.]

Linus has stated that he's providing an additional exception for
user-space programs which use the standard system call interfaces,
and maybe the reiser progs just use standard system calls (as opposed
to custom calls that do things specific to the reiser file system)?

Anyways, it's probably not really all that important [and there are plenty
of alternate file systems if debian decides not to support this one].

-- 
Raul
