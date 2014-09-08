From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv2 0/3] reiser4: block deallocation fixes.
Date: Mon, 08 Sep 2014 22:19:35 +0200
Message-ID: <540E0F57.5090503@gmail.com>
References: <1410201831-11722-1-git-send-email-intelfx100@gmail.com> <540DFD75.8090003@gmail.com> <1965626.b15caRcJVX@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=ishxAKLWTKcq90yy/rtbT2vyxGsS7rCngz6YlWs96I4=;
        b=l/oFcgf/e/ezboY3DNfpCbHxPnFSHqAdTo5aQHfFG0ywAoYkIbF8RiqJLg0ho6GUNG
         BlLfjMnXVEyNfyUwaRJrB4orm55OisoqULyhxgHo/4rjHnHKuOwfsYn/eKQ73ZvjIbIu
         w2DNRSXd9zGy3gvuS4SkZto94iEVrknBRf8Es0duPIbb0v2pNzNYTmNqvwP6ihDnMx22
         OUatWVjVgnOm0BG6vF4N5eNf9f764rmIbZ5MmTga+040XNoaf48i7T1hadXDAveOdGPt
         AR5B7oPT5dVPGr8KoQRWYjl89TLwWCxswKaVqCev316sQit7furP19Blfg0n7s2T+k6w
         Oktw==
In-Reply-To: <1965626.b15caRcJVX@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 09/08/2014 09:52 PM, Ivan Shapovalov wrote:
> On Monday 08 September 2014 at 21:03:17, Edward Shishkin wrote:	
>> Ok, I'll include this to the 3.15.2-reiser4-basic-discard-support.patch
> Good, at least this is done...
>
>> As to 3.16: unfortunately the ancient bug, which leads to non-deleted
>> directories raised the head in 3.16. I don't want to release buggy stuff.
>> So let's work around the stable 3.15 for now..
> Uhm, what relation does that bug have to 3.16? Does it manifest itself more often?


I can reproduce it in 3.10, 3.16.
I can not in 3.11 - 3.15..
