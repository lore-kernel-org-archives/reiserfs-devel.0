From: Edward Shishkin <edward@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Mon, 07 Aug 2006 02:19:09 +0400
Message-ID: <44D66ADD.6020007@namesys.com>
References: <200607312314.37863.bernd-schubert@gmx.de> <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain> <44CF9BAD.5020003@emc.com> <44CF3DE0.3010501@namesys.com> <20060803140344.GC7431@merlin.emma.line.org> <44D219F9.9080404@namesys.com> <44D231DF.1080804@namesys.com> <44D37E1B.1040109@namesys.com> <44D3ECB5.1060106@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D3ECB5.1060106@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <matthias.andree@gmx.de>, ric@emc.com, Alan Cox <alan@lxorguk.ukuu.org.uk>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

Hans Reiser wrote:
> Edward Shishkin wrote:
> 
> 
>>>
>>>How about we switch to ecc, which would help with bit rot not sector
>>>loss?
>>
>>
>>Interesting aspect.
>>
>>Yes, we can implement ECC as a special crypto transform that inflates
>>data. As I mentioned earlier, it is possible via translation of key
>>offsets with scale factor > 1.
>>
>>Of course, it is better then nothing, but anyway meta-data remains
>>ecc-unprotected, and, hence, robustness is not increased..
>>
>>Edward.
> 
> 
> Would you prefer to do it as a node layout plugin instead, so as to get
> the metadata?
> 

Yes, it looks like a business of node plugin, but AFAIK, you
objected against such checks: currently only bitmap nodes have
a protection (checksum); supporting ecc-signatures is more
space/cpu expensive.

Edward.
