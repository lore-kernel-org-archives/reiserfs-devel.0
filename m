From: Tupshin Harper <tupshin@tupshin.com>
Subject: Re: libaal compile fails
Date: Sun, 09 Nov 2003 00:59:11 -0800
Message-ID: <3FAE01DF.7090802@tupshin.com>
References: <3F9F80F0.5040206@namesys.com> <3F9F811D.7070902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16024-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F9F811D.7070902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Yury Umanets <umka@namesys.com>
Cc: S?valdur Gunnarsson <addi@root.is>, ReiserFS <reiserfs-list@namesys.com>

Yury Umanets wrote:

> Yury Umanets wrote:
>
>> >>When I try building libaal it fails with the following error message:
>>
> Forgot to ask. Do you use recent snapshot of libaal?
>
FWIW, I get the exact same problem as Saevaldur. Using 
libaal-0.4.13.tar.gz, and attempting to compile on a Debian Sid x86 
machine. I can only imagine it's a gcc parsing bug (line 213 indeed does 
not have a square bracket). GCC is 3.3.2. Commenting out the check 
performed by that line results in a sucesful compilation.

-Tupshin

