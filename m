From: Will Dyson <will_dyson@pobox.com>
Subject: Re: reiser4 semantics / BeFS Architect(s) Query Resolution
Date: Mon, 30 Aug 2004 22:23:05 -0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <4133E109.5040301@pobox.com>
References: <3DF9165145FACB4C96977FF650C1E9040C46A3D1@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <3DF9165145FACB4C96977FF650C1E9040C46A3D1@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Burnes, James wrote:
> (comments below)
> 
> 
>>-----Original Message-----
>>From: Hans Reiser [mailto:reiser@namesys.com]
>>Sent: Saturday, August 28, 2004 3:55 AM
>>To: Will Dyson
>>Cc: Andrew Morton; hch@lst.de; linux-fsdevel@vger.kernel.org; linux-
>>kernel@vger.kernel.org; flx@namesys.com; torvalds@osdl.org; reiserfs-
>>list@namesys.com
>>Subject: Re: silent semantic changes with reiser4
>>
>>I think there are two ways to analyze the code boundary issue.  One is
>>"does it belong in the kernel?"  Another is, "does it belong in the
>>filesystem. and if so should name resolution in a filesystem be split
>>into two parts, one in kernel, and one in user space."  In ten years I
>>might have the knowledge needed to make such a split, but I know for
>>sure that I don't know how to do it today without regretting it
>>tomorrow, and I don't really have confidence that I will ever be able
>>to do it without losing performance.
>>
>>Glad that BeFS finds the new model better.:)
>>
> 
> (glad that BeFS supposedly solved it)

Solved what, exactly? I'm already having a hard time understanding what 
Hans is talking about.

> BTW: I get paid during the day to do security engineering work.
> Wouldn't parsing the query in the kernel make the kernel susceptible to
> buffer overflows?  Bad place to have an overflow.



-- 
Will Dyson
"Back off man, I'm a scientist!" -Dr. Peter Venkman
