From: David Masover <ninja@slaphack.com>
Subject: Re: Reiser4 and ACLs
Date: Sun, 14 Aug 2005 14:55:22 -0500
Message-ID: <42FFA1AA.1070105@slaphack.com>
References: <42FEC9F1.9040709@perkel.com> <20050814080812.GA22983@king.bitgnome.net> <42FF388F.3010506@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25465-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FF388F.3010506@perkel.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marc Perkel <marc@perkel.com>
Cc: reiser@namesys.com, reiserfs-list@namesys.com

Marc Perkel wrote:
> 
> 
> Mark Nipper wrote:
> 
>>On 13 Aug 2005, Marc Perkel wrote:
>>  
>>
>>>So - how do you get Reiser 4 to work with ACLs? Can't find a mount 
>>>option in any docs.
>>>    
>>>
>>
>>	They are not supported yet under Reiser4.  I'm sure this
>>is keeping just a few people from early adoption at the moment.
>>:)
>>
>>  
>>

> I had been reading that the very reason you want to use Reiser 4 is 
> because that's where the ACLs were going to be. It is after all built on 
> a database

No, it's not.  It's just easy to build a database on top of, without 
having to redesign the storage system.  As I said in my last message, go 
read the whitepaper.

> How can there be a claim that Reiser4 is ready to be merged into the 
> Kernel without ACL support?

Because things don't have to have every feature imaginable to be merged. 
  In fact, quite the opposite -- they have to be sane and stable.
