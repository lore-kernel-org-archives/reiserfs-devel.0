From: Oleg Drokin <green@namesys.com>
Subject: Re: LFS and Large File Support for reiserfs 3.6 (kernel 2.4.19)
Date: Sat, 7 Sep 2002 20:27:09 +0400
Message-ID: <20020907202709.A28312@namesys.com>
References: <IMELKMOINBOOFMGACNMDIENOCLAA.dbergstein@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11395-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <IMELKMOINBOOFMGACNMDIENOCLAA.dbergstein@comcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David R. Bergstein" <dbergstein@comcast.net>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Sat, Sep 07, 2002 at 12:09:21PM -0400, David R. Bergstein wrote:

> I seem to have hit a file size limit on my system where files exceed 4GB in
> size.  I do have an LFS capable glibc (glibc-2.2.4-10.1mdk) on Mandrake 8.1,

4Gb? Hm, strange number, usually LFS problems manifest themselves at
2Gb size.

> running stock kernel 2.4.19, w/o additional patches applied.  This prevents
> me from backing up a large directory of video files over the network, since
> the file truncates itself after 4GB is exceeded.  Any hints to solve this

What tool do you use, have you tried something other?

Bye,
    Oleg
