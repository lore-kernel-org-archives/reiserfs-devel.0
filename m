From: "John D. Heintz" <jheintz@pobox.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 13:47:12 -0500
Message-ID: <407C35B0.3080109@pobox.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com> <407C316B.80606@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17905-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407C316B.80606@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote:

> John D. Heintz wrote:
>
>>
>> Does some sort of syntactic shorthand actually break the set 
>> theoretic naming system rules?  Or is this just something you view as 
>> needless complexity?
>
>
> precisely what syntactic shorthand?



foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions

This assumes a mapping from "nsa" -> "nsa.gov/security/".

The characters up to the ':' would be looked up in a namespaces map, and 
if found the substituion would occur before further name-> object 
resolution. I don't think this breaks the goals set out in the "Future 
Vision" white paper, but I guess that is exactly what I am asking you ;-)

John
