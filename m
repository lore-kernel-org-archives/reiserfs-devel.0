From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Sun, 13 Nov 2005 15:05:25 +0100
Message-ID: <20051113140525.GA21911@kruemel>
References: <200511111359.39715.jgilmore@glycou.com> <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com> <43758E00.4000601@namesys.com> <200511120906.39109.jgilmore@glycou.com> <43765E8D.7030104@namesys.com> <43768EEA.90307@ursynow.2a.pl> <43772F11.7090907@free.fr> <437731A5.9070802@ursynow.2a.pl> <20051113141213.07be2e71@SiRiUS.home>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20051113141213.07be2e71@SiRiUS.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ingo@bormuth.org

On 2005-11-13 14:12, Thomas Kuther wrote:
>
> hmm, wondering which I/O scheduler you guys are using. 
> I had the same slowdowns and soft lockups till 10 minutes ago, when i
> switched from cfq to anticipatory I/O. I'm currently usig 2.6.15-rc1 +
> reiser4 from 2.6.14-mm2
> I was in the middle of a big gentoo'ish emerge, desktop almost
> unusable. but now with anticipatory all seems fine so far. 
> the compile seems a lot faster. no soft lockup trying to use vim or
> locate... hmmm
> 

Same here. 

I used to be hit by loads of 20 (!) and a systen being practically unusable 
for half an hour, everytime I synced the gentoo tree. After switching from 
2-6-14-archck5 to reiser4-for-vanilla-2.6.14-2.patch applied to vanilla
linux-2.6.14.2 everything seems to work just fine.

BTW find ebuild at: http://public.efil.de/gentoo/sys-kernel/reiser4-sources/


-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517          '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact     ---ooO--(.)--Ooo---

