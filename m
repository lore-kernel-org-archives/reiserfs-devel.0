From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 11:57:13 -0500
Message-ID: <407C1BE9.8010509@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407C15D9.1080705@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:

> John D. Heintz wrote:
>
>>
>> Hans,
>>
>> If I understand the naming system primitives correctly then the ":" 
>> introduces a new sequence operator and does evil things to closure, 
>> right?
>>
>> Let's use an example that is likely to conflict: Security plugins 
>> introducing a name "permissions" to objects.
>>
>> Here is my list of how to expose this:
>> 1) foo.txt/permissions
>> * likely to conflict with end-user names and other security provider 
>> names
>
>
> this would be foo/metas/permissions/owner, does that resolve the 
> problem in your eyes?
>

Let me verify something: You are suggesting that the "metas" namespace 
be the entry point for all of the plugin namespaces? I had assumed that 
each plugin would create it's own. That does certainly reduce the scope 
of my problem.

I'm not sure it removes the problem though, it just pushes the 
bottleneck one level away. That is still a good thing: it removes those 
conflicts from user created names, but not from plugin suppliers.

What if two suppliers of security plugins wanted to expose 
"permissions"? I'm thinking of the GNOME or KDE file managers growing a 
GUI permisions dialog to edit the structure of  data/information in the 
permissions namespace.

If
# cat foo/meta/permissions
# WhiteHat open source LDAP security plugin
owner   jheintz
grant   some stuff...
....

then user applications (like GUI filemanagers) will start depending on 
that. (Or the sub-structure exposed as further names...) Do you not 
think this will cause problems when
# cat foo/meta/permissions
# NSA Cryptographic security plugin
authority   The Office of John Heintz
status    confidential
grant   some stuff...
....

If I didn't mind typing really long names I'd say the following is 
absolutely correct and gives no worry about naming conflict:
cat foo/metas/nsa.gov/permissions
cat foo/metas/whitehat.com/permissions

(But then again I'd say the following does as well:
cat foo/nsa.gov/permissions
cat foo/whitehat.com/permissions)

I just don't want to type more than I have to. Thanks for the replies,
John Heintz


>> 2) foo.txt/white-hat-permissions
>> * verbose, but negligible risk of conflicts
>> 3) foo.txt/white-hat-security/permissions
>> * nested namespace to provide isolation
>> 4) foo.txt/<wh-sec>permissions
>> * syntax implying substitution before name resolution
>> * could be some other syntax like foo.txt/wh-sec:permissions
>>
>> I don't like 1) or 2), and I also don't see much real difference 
>> between 3) and 4).
>>
>> I'm guessing that the syntax of 4) is problem: like the ":" is 
>> introduces new sequencial operations. I'm viewing it as just a 
>> syntactic shorthand with a clear translation to the actual name.
>>
>> Thanks,
>> John
>>
>>

