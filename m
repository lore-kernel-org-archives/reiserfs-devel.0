From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Wed, 11 Aug 2004 14:03:57 +0400
Message-ID: <4119EF0D.7030907@namesys.com>
References: <20040810212733.4BA8315C56@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20180-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040810212733.4BA8315C56@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: 'Alex Zarochentsev' <zam@namesys.com>, 'Hans Reiser' <reiser@namesys.com>, 'ReiserFS List' <reiserfs-list@namesys.com>

Hello

David Dabbs wrote:
> 
>>-----Original Message-----
>>From: Alex Zarochentsev [mailto:zam@namesys.com]
>>Sent: Tuesday, August 10, 2004 4:07 PM
>>To: David Dabbs
>>Cc: 'Hans Reiser'; 'ReiserFS List'
>>Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output
>>error"
>>
>>On Tue, Aug 10, 2004 at 04:06:24PM -0500, David Dabbs wrote:
>>
>>>I have been running benchmarks with SYNC=off, as the mongo page
>>>recommends against doing so. In configs where SYNC=ON we would
>>>omit the syncs/waits, yes?
>>
>>not sure. metadata need to be synched still.
>>
>>Alex.
> 
> 
> Saw following recently on LKML re. ext3. Does r4 O_SYNC not sync metadata?
> 

It does. Well, it should.

>  
>>From Theodore Ts'o
> Subject Re: ext3 and SPEC SFS Run rules. 
> 
> On Mon, Jul 26, 2004 at 10:12:01AM +0100, Tigran Aivazian wrote:
> 
>>On Mon, 26 Jul 2004, Andrew Morton wrote:
>>
>>>ext3 should be fully syncing data and metadata for both fsync()
>>>and O_SYNC writes in all three journalling modes.  
>>>If not, that's a big bug.
> 
> 
> David
> 
> 
> 
> 


