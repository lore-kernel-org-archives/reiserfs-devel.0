From: Tupshin Harper <tupshin@tupshin.com>
Subject: Re: libaal compile fails
Date: Sun, 09 Nov 2003 01:46:07 -0800
Message-ID: <3FAE0CDF.9080104@tupshin.com>
References: <3F9F80F0.5040206@namesys.com> <3F9F811D.7070902@namesys.com> <3FAE01DF.7090802@tupshin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16025-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FAE01DF.7090802@tupshin.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS <reiserfs-list@namesys.com>
Cc: Yury Umanets <umka@namesys.com>, S?valdur Gunnarsson <addi@root.is>

Tupshin Harper wrote:

> Yury Umanets wrote:
>
>> Yury Umanets wrote:
>>
>>> >>When I try building libaal it fails with the following error message:
>>>
>> Forgot to ask. Do you use recent snapshot of libaal?
>>
> FWIW, I get the exact same problem as Saevaldur. Using 
> libaal-0.4.13.tar.gz, and attempting to compile on a Debian Sid x86 
> machine. I can only imagine it's a gcc parsing bug (line 213 indeed 
> does not have a square bracket). GCC is 3.3.2. Commenting out the 
> check performed by that line results in a sucesful compilation.
>
> -Tupshin
>
A bit more info.

It is not a problem with the gcc version, as the same message comes from 
3.2 and 2.95.

I'm guessing that it emerges from macros expanded through multiple 
layers of expansion.
BLKGETSIZE64 expands to _
IOR(0x12, 114, sizeof(uint64_t))

_IOR expands to
_IOC(_IOC_READ,(type),(nr),(_IOC_TYPECHECK(size)))

and _IOC_TYPECHECK expands to
((sizeof(t) == sizeof(t[1]) && sizeof(t) < (1 << _IOC_SIZEBITS)) ? 
sizeof(t) : __invalid_size_argument_for_IOC)

which is the first hint of a bracket on that line. That's as far as I'm 
going ;-).

-Tupshin

