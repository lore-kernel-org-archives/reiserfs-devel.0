From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 09:40:42 -0500
Message-ID: <407BFBEA.5010006@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407AEA05.50004@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com


Hans,

If I understand the naming system primitives correctly then the ":" 
introduces a new sequence operator and does evil things to closure, right?

Let's use an example that is likely to conflict: Security plugins 
introducing a name "permissions" to objects.

Here is my list of how to expose this:
1) foo.txt/permissions
 * likely to conflict with end-user names and other security provider names
2) foo.txt/white-hat-permissions
 * verbose, but negligible risk of conflicts
3) foo.txt/white-hat-security/permissions
 * nested namespace to provide isolation
4) foo.txt/<wh-sec>permissions
 * syntax implying substitution before name resolution
 * could be some other syntax like foo.txt/wh-sec:permissions

I don't like 1) or 2), and I also don't see much real difference between 
3) and 4).

I'm guessing that the syntax of 4) is problem: like the ":" is 
introduces new sequencial operations. I'm viewing it as just a syntactic 
shorthand with a clear translation to the actual name.

Thanks,
John


John D. Heintz wrote:

> Ah, I didn't do a good job of explaining the key benefit that I see in 
> something like this.
>
> "foo.txt/reiser4:uid"
> is syntactic magic for
> "foo.txt/www.namesys.com/meta/uid"
>
> when "reiser:" means "www.namesys.com/meta/uid" and ignoring URI prefix.
>
> To me this is all about
> 1) a correct mechanism to both unify namespaces
> 2) _and_ avoid name conflicts
> 3) _and_ keep nice short file paths.
>
> The chance that somebody else is going to name a file "meta" or 
> "metas" is really high, the chance that someone will name a file 
> "www.namesys.com/meta" is really low. But I don't want to type that in 
> all the time.
>
> I've drank the cool-aid about unified namespaces, but I feel that 
> naming conflicts is still way too big a problem to just say "it's not 
> a big deal" over.
>
> Thanks,
> John
>
> Hans Reiser wrote:
>
>> Mhy colon instead of / ?
>>
>> There is no reason for it.  Implementing a storage layer to make XML 
>> storage more efficient might be commercially interesting, but XML is 
>> not what we should copy for namespace style.
>>
>> Hans
>>
>> John D. Heintz wrote:
>>
>>> Hi all,
>>>
>>> I work with XML quite a lot in my job and deal with XML namespaces 
>>> often. While I think they have some problems in the XML world (poor 
>>> integration with XML InfoSet) they might be useful for Reiser4 and 
>>> they seem to play well with the Set Theoretic underlying models (as 
>>> far as I can tell :).
>>>
>>> Here's what I'm thinking:
>>> Instead of `cat foo.txt/metas/uid`
>>> it would be `cat foo.txt/reiser4:metas/uid` or perhaps `cat 
>>> foo.txt/reiser4:uid`.
>>>
>>> Here the "reiser4" shorthand would map to 
>>> "http://www.namesys.com/v4" or whatever Hans and team decided.
>>>
>>> The reiser4 namespace could be hardcoded or compiled in  and exposed 
>>> via `cat /proc/fs/reiser4/namespace`.
>>>
>>> Other namespaces could be added to files/directories and I'd assume 
>>> something like:
>>> `cat foo.txt/reiser4:namespaces` would list all the namespaces 
>>> available for a particular file.
>>> Something like:
>>> reiser4    http://www.namesys.com/v4
>>> streams   http://www.evil-empire.com/streams
>>> snapcm   http://www.snapcm.com/snapcm
>>>
>>> John D. Heintz
>>>
>>> ps - SnapCM is the name of a versioned linking model that I 
>>> developed some time ago and hope one day to build a plugin for 
>>> Reiser4. I'm being optimistic listing it in the available 
>>> namespaces. ;-)
>>>
>>>
>>
>>
>
>
>


