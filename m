From: "Teran McKinney" <sega01@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Wed, 10 Dec 2008 21:41:43 +0000
Message-ID: <b245135e0812101341k4aa15372ja2f72d0f53a7df77@mail.gmail.com>
References: <494035ED.4000706@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=jDqWNKZ4W/Zs+mlfeFfElhBpWjAwaDdkzjtJ00zCf0A=;
        b=dhSzyHiDnea0YXIF0xysKGp9aeG6g5phtfWBeENjMLBLzglHteZ3Hmnce9+3WvmJij
         O7l9pj5kL7NfPi7mZGqKCO8w+cam+bP3p7P0N0qxif2w8B9v4lUZlq3q5BefEQAWiwwS
         JpWZOD7v4lCUfaP7nGd8bRes9NTPuSHmHJom4=
In-Reply-To: <494035ED.4000706@gmx.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Of course, D would be a great choice, but C# may be better. I hear
that Torvalds really wants to see more Mono drivers in the kernel.
What else would we do with our 4GB RAM machines?

No seriously, nothing in the kernel is coded in anything but C or
assembler. You might as well just make the C code a little more
pretty.

--Teran

On Wed, Dec 10, 2008 at 21:34, Ralph Ulrich <eulenreich@gmx.de> wrote:
> Is it true that the programming style of reiser4 is recursive style and
> that this kind of style was rejected from the kernel developers?
>
> If  true: How much effort would it be to recode reiser4 to a style which
> has a chance of inclusion in the linux kernel?
>
> And if there will be a recoding effort to be made, wouldn't it be a
> great idea to use a cleaner and more modern programming language link D ?
>
> Thanks in advance for answering my more general questions.
> Ralph
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
