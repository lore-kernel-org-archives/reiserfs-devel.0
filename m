From: =?ISO-8859-1?Q?Ren=E9_Rebe?= <rene@rocklinux-consulting.de>
Subject: Re: [2.6.8] Strange FS corruption on sparc64
Date: Sat, 21 Aug 2004 11:05:10 +0200
Message-ID: <41271046.7020309@rocklinux-consulting.de>
References: <20040821000112.GM8070@triplehelix.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20453-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040821000112.GM8070@triplehelix.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Joshua Kwan <joshk@triplehelix.org>
Cc: reiserfs-list@namesys.com

Hi,

Joshua Kwan wrote:

> I've been tasking my UP sparc64 for a few days now to build lots of
> kernels for Debian. However, during the build, it must have stumbled
> across some inconsistency in my reiser3 filesystem:

Interesting - I tried to use ReiserFS on my (UltraSPARC) SPARC, too. But=20
at that time the reiserfsprogs did not liked to be compiled on sparc(32)=20
due to the usage of kernel headers for bit operations and those are=20
implemented in software on sparc32. Are the tools fixed in the meantime?=20
Or do you use a 64bit only userspace version of the reiserfstools?

   Ren=E9
