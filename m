From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Why patch reiser4-for-3.17.3.patch does not apply ?
Date: Mon, 19 Jan 2015 19:12:08 +0100
Message-ID: <54BD48F8.3060501@gmail.com>
References: <9cc275035b16b88c3bd4ada2aa9786f0@mail.velocitynet.com.au> <20150119174931.68bac05a@Ulf.tvoe.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=cdUKYXtRZ2vOQgpD324PGPmQjsdCuxcwZ79QCzRqckU=;
        b=d7SnffWSqcgJWWdWD0Vcbnf0LO0kix9y7OZ6/PDBjvxupX0xo+A1fT4kNocuzdm491
         wTNyDSmygyxHts3v1lLDdDWnrJl6sNhKiHMc5fWQKh338It+tziNb+Jm++fDcao00WKg
         45NoEe5xxqe/g6Sw6LDcYlk7CywgetnnMkGn7g/fBWau6YKMveT9SZGqX5DeNj3FVV55
         x0X/iuFSa9jRrOdhaWA96TCVTU/d5IWbH+aPn3uWdXbinXQhdgVO9guefp8GiDkSfoof
         TnJ/D3qod4pevaEUZdz3OufmI7gSb4g0ZImxmlht0byNSiJuL0dU+PuloLmzd6YXQ3c5
         x9FA==
In-Reply-To: <20150119174931.68bac05a@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru

It applies just fine to 3.17


On 01/19/2015 03:49 PM, dimas wrote:
> why are you trying to apply 3.17.3 patch to the older kernel?
>
>
> 2015-019 17:52 doiggl@velocitynet.com.au <doiggl@velocitynet.com.au> wrote:
>> Hello,
>> The reiser4-for-3.17.3.patch fails against linux-3.17.tar
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

