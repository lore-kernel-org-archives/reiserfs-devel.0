From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuild-tree fails in pass 2
Date: Thu, 15 Jan 2004 16:30:23 +0300
Message-ID: <200401151630.23705.vitaly@namesys.com>
References: <400692d3.46c9.0@cpinternet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16522-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <400692d3.46c9.0@cpinternet.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mharnois@cpinternet.com, reiserfs-list@namesys.com

On Thursday 15 January 2004 16:17, Michael Harnois wrote:
> None of the above. It first failed from a Debian installation,
> then I rebuilt it from scratch and got the same error. It
> doesn't fail checking any of my other partitions, just this
> one, and it dies in the same spot each time.

ok, would you run 
	debugreiserfs -p /dev/xxx | bzip2 -c > xxx.bz2
and privide it for downloading, I will test it locally on your data.

-- 
Thanks,
Vitaly Fertman
