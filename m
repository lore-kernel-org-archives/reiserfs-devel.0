From: Oleg Drokin <green@namesys.com>
Subject: Re: bug report: attributes ( chattr +a ) not respected by reiserfs 3,6, but this isn't listed in man mkreiserfs
Date: Sun, 13 Jul 2003 17:10:10 +0400
Message-ID: <20030713131010.GA6240@namesys.com>
References: <200307121010.07215.marvin@synapse.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307121010.07215.marvin@synapse.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "D.A.M. Revok" <marvin@synapse.net>
Cc: info@suse.com, reiserfs-list@namesys.com

Hello!

On Sat, Jul 12, 2003 at 10:10:07AM -0400, D.A.M. Revok wrote:
> Please declare this in man .*reiser.*
> ( and also in the --help listings for 'em ), since it is kind of 
> important to know *when* one is setting-up a filesystem
> ( rather than after the system's been built... )
> so that no others will try setting 
> chattr +a logfile
> to make it append-only, as part of system-security, because the attribute 
> set is non-meaningful.  ext3 respects this attribute.
> This on SuSE 8.1 Pro and 8.2 Pro's kernel, maybe the stock kernel has it 
> working, but I figure it'd be better to tell you people and let youse 
> sort-it-out.

How do you tell it is not meaningful? Hve you tried to
mount with -o attrs mount option?

Bye,
    Oleg
