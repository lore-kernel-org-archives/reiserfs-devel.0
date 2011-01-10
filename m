From: Simon <sur3@gmx.de>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Mon, 10 Jan 2011 18:14:19 +0100
Message-ID: <4D2B3E6B.4060300@gmx.de>
References: <4CE87674.4090909@gmail.com> <4CF4CD6E.4040305@gmx.de> <4CF4E224.2040203@gmail.com> <4CF51FAF.4040904@gmx.de> <4D2B1F4C.7090706@gmx.de> <4D2B259B.7010203@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D2B259B.7010203@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

>> Ah, sorry,
>> finally found the error, it isnt the reiser4, but a buggy network-driver.
> Nup, that was exactly reiser4 badness: it stepped to other journalling
> file systems (ext3 in your case). Here is similar bugreport:
Well then my kernel has more than one bug, because the network driver IS
also broken :D

> Sorry that I've forgot to cc you.
np, will upgrade my old 2.6.36/reiser4 kernel,
but already changed to 2.6.37/ext4,
but still have some external reiser4 drives,
so waiting for an 2.6.37-patch. ;)

> Thanks,
> Edward.
thx!
Simon
