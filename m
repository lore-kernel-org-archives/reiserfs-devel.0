From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Re[3]: Is there a way to change root inode from -1 to what ever    it    will    work?
Date: Thu, 12 Aug 2004 14:17:16 +0400
Message-ID: <200408121417.16087.vitaly@namesys.com>
References: <20040811183322.5806.qmail@qmail-local.inova.com.br> <20040811210019.27186.qmail@qmail-local.inova.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040811210019.27186.qmail@qmail-local.inova.com.br>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rodolfo Sikora <sikora@inova.com.br>, reiserfs-list@namesys.com

Hi,

I think you have some problem with ram.
1 - fsck aborts on different places all the time on your computer;
2 - first bz2 failed to bunzip2 on my computer;
3 - second bz2 had some problems on unpacking with 'debugreiserfs -u'
also, I just jumped them over in gdb so was able to unpack most of the data;
4 - fsck (3.6.18) worked fine for me on your metadata.

in the case of a hardware problem, I want to point to the fact that 
we deal with them under www.namesys.com/support.html terms.

-- 
Thanks,
Vitaly Fertman

