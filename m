From: Ingo Bormuth <ibormuth@efil.de>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 19:42:35 +0100
Message-ID: <20051123184235.GA23055@kruemel>
References: <200511171447.41362.mail@earthworm.de> <200511231253.37328.mail@earthworm.de> <20051123121751.GC26252@favonius> <200511231321.18455.mail@earthworm.de> <20051123122809.GA31528@favonius> <43846A0C.6010808@namesys.com> <20051123151016.GA7768@favonius> <4384888E.2040407@namesys.com> <20051123153140.GA1736@favonius> <43848FB1.4050001@namesys.com>
Reply-To: Ingo Bormuth <ibormuth@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27118-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <43848FB1.4050001@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: ingo@bormuth.org

On 2005-11-23 18:50, Vladimir V. Saveliev wrote:
> It would be great to hear that mounting noatime or unapplying that patch fixes
> all problmes, including the one with evolution's field resizing and vim's ":wq".

I posted before that I don't see the problem. 
Well, all reiser4 partitions are mounted -o noatime,nodiratime ;)

Remounting with -o atime,diratime immediately makes the system creap 
as if it was an old snail.

-- 
Ingo Bormuth, voicebox & telefax: +49-12125-10226517          '(~o-o~)'
public key 86326EC9, http://ibormuth.efil.de/contact     ---ooO--(.)--Ooo---

