From: Kaelyn Uhrain <Kaelyn.Alexi+reiserfs@gmail.com>
Subject: Re: Quick & dirty r4 for 2.6.37
Date: Wed, 26 Jan 2011 13:00:18 -0800
Message-ID: <AANLkTi=c=6YxT3QhzcZxhYwm46KfGWpCsxhyZQyBLJ=v@mail.gmail.com>
References: <AANLkTi=Mi1QEC+Wjr5ka4uMZH72WytvsszC+yycRKaqq@mail.gmail.com>
	<AANLkTi=trDJKzq5x4ic0qzkzCseDMgzci29NnTqDbzco@mail.gmail.com>
	<4D408967.3060004@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=5V+pbd1EbH0YdaOg/6fJsuvPI5o9SJIJZ5I7AStROc4=;
        b=d9zwtIkP6UrTnddhQKRpck0PN1C1FLd2Xi/JwGK4NKBdXkU5pYowTJi3FmU9mksB2I
         72D8O2b7LwnkagUke5OL6akZeMU/xXCJ2qEcMKbcNe/k/hXkkY7Hnc8NqcbiANCudlan
         ihIAguObraIEPyW4zQttyoa1c3e2AajnieQqo=
In-Reply-To: <4D408967.3060004@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Glad to hear you've prepared a proper .37 patch that will be available =
soon! ^.^

On Wed, Jan 26, 2011 at 12:51 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Kaelyn Uhrain wrote:
>>
>> Ack! Just realized I'd created the patch based on the
>> reiser4-for-2.6.36.path.bz2 from November and not the latest r4 patc=
h.
>> =A0Here is an amended version of my patch that removes the export of
>> generic_writeback_sb_inodes and the definition & export of
>> writeback_skip_sb_inodes from fs/fs-writeback.c as they're already i=
n
>> vanilla 2.6.37.
>>
>
> writeback_skip_sb_inodes() in vanilla? With whose blessing? :)
> You are confused :)

Yeah, I was confused about it.  My tree got a bit munged after I'd
realized I'd been working with an old version of the .36 r4 patch and
had tried to update my tree without doing the smart thing of backing
out all changes and reapplying them.

Sorry for the confusion!

Cheers,
Kaelyn
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
