From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Thu, 11 Dec 2008 01:23:33 +0300
Message-ID: <49404165.6050806@gmail.com>
References: <494035ED.4000706@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <494035ED.4000706@gmx.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph Ulrich wrote:
> Is it true that the programming style of reiser4 is recursive style

what is a definition of recursive programming style?

>  and
> that this kind of style was rejected from the kernel developers?
>   

AFAIK they were unhappy with assertions and "coding nits"  like
if (foo) {
        bar();
}
Eventually akpm said that assertions are okay and guys send
cleanup patches against other issues once in a while.

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
>   

