From: Toby Thain <toby@telegraphics.com.au>
Subject: Re: The reiser4 programming style is recursive?
Date: Wed, 10 Dec 2008 23:49:09 -0500
Message-ID: <EA899519-A5D9-484E-A7D1-51BEDFC60130@telegraphics.com.au>
References: <494035ED.4000706@gmx.de> <b245135e0812101341k4aa15372ja2f72d0f53a7df77@mail.gmail.com> <49403DBE.2070200@gmx.de>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49403DBE.2070200@gmx.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org


On 10-Dec-08, at 5:07 PM, Ralph Ulrich wrote:

> Teran McKinney schrieb:
>> Of course, D would be a great choice, but C# may be better. I hear
>> that Torvalds really wants to see more Mono drivers in the kernel.
>> What else would we do with our 4GB RAM machines?
> There is even a Ms project for that :-)
>>
>> No seriously, nothing in the kernel is coded in anything but C or
>> assembler. You might as well just make the C code a little more
>> pretty.
> But you know that D is meant for drivers - as a C++ replacement!?

Define 'driver'!

C++ has nothing to do with the Linux kernel (and nor does D). The  
kernel and its subsystems will continue to be written in C for the  
fore-C-able future.


>
> You didn' answer my main question:
>>> Is it true that the programming style of reiser4 is recursive  
>>> style and
>>> that this kind of style was rejected from the kernel developers?
>
As for 'recursion', it is nothing to be afraid of. Except the kind  
that blows stacks. ;-)

--Toby


> Greeting from rainy Hamburg,
> Ralph
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs- 
> devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

