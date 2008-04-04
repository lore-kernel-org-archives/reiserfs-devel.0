From: Toby Thain <toby@telegraphics.com.au>
Subject: Re: bad block management
Date: Fri, 4 Apr 2008 18:41:08 -0400
Message-ID: <55BBBFE8-2D91-492E-86DA-630BDA1A5EC0@telegraphics.com.au>
References: <16413477.post@talk.nabble.com> <alpine.DEB.1.10.0804012050350.7128@sheep.housecafe.de> <47F28DE5.1060402@emc.com>  <47F29257.3000502@suse.com> <1207268072.379391.7.camel@localhost> <02D8FA59-0FF5-444C-BAAF-17A4BEA847AF@telegraphics.com.au> <1207325530.7624.2.camel@localhost>
Mime-Version: 1.0 (Apple Message framework v753)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1207325530.7624.2.camel@localhost>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Zan Lynx <zlynx@acm.org>
Cc: Jeff Mahoney <jeffm@suse.com>, ric@emc.com, Christian Kujau <lists@nerdbynature.de>, kgp <jyotiv@tataelxsi.co.in>, reiserfs-devel@vger.kernel.org


On 4-Apr-08, at 12:12 PM, Zan Lynx wrote:
> On Fri, 2008-04-04 at 00:21 -0400, Toby Thain wrote:
>> On 3-Apr-08, at 8:14 PM, Zan Lynx wrote:
>
>>> A RAID media verify or a badblocks -n run can usually fix these.
>>
>> Only if your RAID uses CRCs (most don't).
>>
>> ZFS is the real answer to undetected corruption.
>
> If one hard disk returns a CRC read error for a block but the other
> RAID-1 mirror disk or the parity disk(s) return good blocks, the array
> controller should know which data is good and which is bad in order to
> rewrite a good copy.


That's a lot of IFs. I prefer ZFS' approach: Check which side of the  
mirror is bad, and take the good side.

--Toby

> -- 
> Zan Lynx <zlynx@acm.org>

