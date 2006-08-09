From: David Masover <ninja@slaphack.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Wed, 09 Aug 2006 11:52:33 -0400
Message-ID: <44DA04C1.7040306@slaphack.com>
References: <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <44CF87E6.1050004@slaphack.com> <20060806225912.GC4205@ucw.cz> <44D99ED9.1030003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751073AbWHIPwg@vger.kernel.org>
In-Reply-To: <44D99ED9.1030003@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Pavel Machek <pavel@ucw.cz>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, Bernd Schubert <bernd-schubert@gmx.de>, reiserfs-list@namesys.com, Jan-Benedict Glaw <jbglaw@lug-owl.de>, Clay Barnes <clay.barnes@gmail.com>, Rudy Zijlstra <rudy@edsons.demon.nl>, Adrian Ulrich <reiser4@blinkenlights.ch>, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Hans Reiser wrote:
> Pavel Machek wrote:
> 
>>
>> Yes, I'm afraid redundancy/checksums kill write speed,
>>
> they kill write speed to cache, but not to disk....  our compression
> plugin is faster than the uncompressed plugin.....

Regarding cache, do we do any sort of consistency checking for RAM, or 
do we leave that to some of the stranger kernel patches -- or just an 
occasional memtest?
