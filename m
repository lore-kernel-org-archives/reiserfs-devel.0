From: Edward Shishkin <edward@namesys.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org
 regarding reiser4 inclusion
Date: Tue, 08 Aug 2006 15:06:21 +0400
Message-ID: <44D8702D.1090005@namesys.com>
References: <200607312314.37863.bernd-schubert@gmx.de> <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain> <44CF9BAD.5020003@emc.com> <44CF3DE0.3010501@namesys.com> <20060803140344.GC7431@merlin.emma.line.org> <44D219F9.9080404@namesys.com> <20060807075744.GA8894@merlin.emma.line.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060807075744.GA8894@merlin.emma.line.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matthias Andree <matthias.andree@gmx.de>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Matthias Andree wrote:
> [stripping Cc: list]
> 
> On Thu, 03 Aug 2006, Edward Shishkin wrote:
> 
> 
>>>What kind of forward error correction would that be,
>>
>>Actually we use checksums, not ECC. If checksum is wrong, then run
>>fsck - it will remove the whole disk cluster, that represent 64K of
>>data.
> 
> 
> Well, that's quite a difference...
> 
> 
>>Checksum is checked before unsafe decompression (when trying to
>>decompress incorrect data can lead to fatal things).
> 
> 
> Is this sufficient? How about corruptions that lead to the same checksum
> and can then confuse the decompressor? 


It is a multiplication of two unlikely events: fs corruption
and 32-hash collision. Paranoid people can assign zlib-based
transform plugin: afaik everything is safe there.


Is the decompressor safe in that
> it does not scribble over memory it has not allocated?
> 

yes

