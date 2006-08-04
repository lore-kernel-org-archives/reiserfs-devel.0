From: Toby Thain <toby@smartgames.ca>
Subject: Re: Checksumming blocks? [was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Fri, 4 Aug 2006 11:56:24 +0400
Message-ID: <8618C0ED-A530-4414-8B86-3D6B42C84604@smartgames.ca>
References: <200607312314.37863.bernd-schubert@gmx.de> <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl> <20060801165234.9448cb6f.reiser4@blinkenlights.ch> <1154446189.15540.43.camel@localhost.localdomain> <44CF84F0.8080303@slaphack.com> <1154452770.15540.65.camel@localhost.localdomain> <44CF9217.6040609@slaphack.com> <20060803135811.GA7431@merlin.emma.line.org> <44D285DF.7060905@elegant-software.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44D285DF.7060905@elegant-software.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Russell Leighton <russ@elegant-software.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


On 4-Aug-06, at 3:25 AM, Russell Leighton wrote:

>
> If the software (filesystem like ZFS or database like Berkeley DB)   
> finds a mismatch for a checksum on a block read, then what?
>
> Is there a recovery mechanism, or do you just be happy you know  
> there is a problem (and go to backup)?

ZFS will correct from a good mirror (http://blogs.sun.com/roller/page/ 
bonwick?entry=zfs_end_to_end_data).
--T

>
> Thx
>
> Matthias Andree wrote:
>
>> Berkeley DB can, since version 4.1 (IIRC), write checksums (newer
>> versions document this as SHA1) on its database pages, to detect
>> corruptions and writes that were supposed to be atomic but failed
>> (because you cannot write 4K or 16K atomically on a disk drive).
>>
>

