From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Mon, 12 Apr 2004 14:12:05 -0500
Message-ID: <407AEA05.50004@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17878-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407ADCBF.8000609@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Ah, I didn't do a good job of explaining the key benefit that I see in 
something like this.

"foo.txt/reiser4:uid"
 is syntactic magic for
"foo.txt/www.namesys.com/meta/uid"

when "reiser:" means "www.namesys.com/meta/uid" and ignoring URI prefix.

To me this is all about
1) a correct mechanism to both unify namespaces
2) _and_ avoid name conflicts
3) _and_ keep nice short file paths.

The chance that somebody else is going to name a file "meta" or "metas" 
is really high, the chance that someone will name a file 
"www.namesys.com/meta" is really low. But I don't want to type that in 
all the time.

I've drank the cool-aid about unified namespaces, but I feel that naming 
conflicts is still way too big a problem to just say "it's not a big 
deal" over.

Thanks,
John

Hans Reiser wrote:

> Mhy colon instead of / ?
>
> There is no reason for it.  Implementing a storage layer to make XML 
> storage more efficient might be commercially interesting, but XML is 
> not what we should copy for namespace style.
>
> Hans
>
> John D. Heintz wrote:
>
>> Hi all,
>>
>> I work with XML quite a lot in my job and deal with XML namespaces 
>> often. While I think they have some problems in the XML world (poor 
>> integration with XML InfoSet) they might be useful for Reiser4 and 
>> they seem to play well with the Set Theoretic underlying models (as 
>> far as I can tell :).
>>
>> Here's what I'm thinking:
>> Instead of `cat foo.txt/metas/uid`
>> it would be `cat foo.txt/reiser4:metas/uid` or perhaps `cat 
>> foo.txt/reiser4:uid`.
>>
>> Here the "reiser4" shorthand would map to "http://www.namesys.com/v4" 
>> or whatever Hans and team decided.
>>
>> The reiser4 namespace could be hardcoded or compiled in  and exposed 
>> via `cat /proc/fs/reiser4/namespace`.
>>
>> Other namespaces could be added to files/directories and I'd assume 
>> something like:
>> `cat foo.txt/reiser4:namespaces` would list all the namespaces 
>> available for a particular file.
>> Something like:
>> reiser4    http://www.namesys.com/v4
>> streams   http://www.evil-empire.com/streams
>> snapcm   http://www.snapcm.com/snapcm
>>
>> John D. Heintz
>>
>> ps - SnapCM is the name of a versioned linking model that I developed 
>> some time ago and hope one day to build a plugin for Reiser4. I'm 
>> being optimistic listing it in the available namespaces. ;-)
>>
>>
>
>

