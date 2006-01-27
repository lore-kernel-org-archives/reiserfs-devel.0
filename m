From: Sujit Choudhury <S.Choudhury@westminster.ac.uk>
Subject: Re: dump in reiserfs
Date: Fri, 27 Jan 2006 14:18:17 +0000
Message-ID: <43DA2BA9.8040100@Westminster.ac.uk>
References: <43D9FB3E.9030309@Westminster.ac.uk> <1138363595.6238.49.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27900-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1138363595.6238.49.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Thanks Vladimir.  Is there anything that we can use so that we dump the 
filesystem and use pipe to restore it from the input?
By dump (I mean a replacement dump command).

Many thanks again.

sujit

Vladimir V. Saveliev wrote:
> Hello
> 
> On Fri, 2006-01-27 at 10:51 +0000, Sujit Choudhury wrote:
> 
>>We are running a SLES 8 box which has reiserfs filesystem  Can we use 
>>dump and restore in a normal way for a 360GB of data?
>>
> 
> 
> no, dump and restore are for ext2,
> reiserfs does not have dump. You should use filesystem independent
> backup program.
> 
> 
>>Regards
>>
>>Sujit Choudhury
>>
> 
> 
