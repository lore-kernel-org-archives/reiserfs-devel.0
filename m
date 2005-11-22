From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 12:34:49 +0100
Message-ID: <20051122113449.GA5284@kruemel>
References: <200511171447.41362.mail@earthworm.de> <200511221123.51724.marcel@hilzinger.hu>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27071-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200511221123.51724.marcel@hilzinger.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ingo@bormuth.org

On 2005-11-22 11:23, Marcel Hilzinger wrote:
> 
> Did you ever think about, that this is not a reiser4 problem, but a kernel bug 
> or a problem related to hal? 
> 

Just to mention again:

I do not see the problem on my Laptop. I use a the clean vanilla-2.6.14.2 
kernel manually patched with reiser-for-2.6.14-1. It's a slow laptop with
broken DMA so I should realize if there was something wrong.

Afaik every poster complaining so far had mm-kernels, larger patchsets or
additional stuff as swsusp2. So: Do jou see the slowdown/crashes in vanilla ?


-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

