From: Newsmail <newsmail@satimex.tvnet.hu>
Subject: Re: lvm+loop-aes+reiserfs / iput deadlock fix
Date: Thu, 30 Jan 2003 13:43:07 +0100
Message-ID: <5.2.0.9.2.20030130133238.03746610@pop.tvnet.hu>
References: <5.2.0.9.2.20030129233147.02056cf8@pop.tvnet.hu>
 <5.2.0.9.2.20030129233147.02056cf8@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030130143218.A1057@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

well, I'm using loop-aes'(loop-aes.sourceforge.net) AES128 on every HD, and 
on top of that I use LVM, and reiserfs on top of all this. Of course I know 
not only reiserfs changed in 2.4.20. First of all I'll set up a 2.4.20 at 
my home pc, and I'll reproduce the problem there. then I'll try to revert 
the 2.4.20-preX pending patches, and see what happens. if I find anything 
I'll send it to you. if all this doesnt work out I'll set you up a remote 
machine where the problem exists so you can investigate the problem there.
regards,
greg


