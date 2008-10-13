From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Correct fsck behavior on boot
Date: Mon, 13 Oct 2008 16:11:33 +0400
Message-ID: <48F33AF5.6010707@gmail.com>
References: <48C9004A.5080504@gmail.com> <80294dc60809110450i20d43214o144b754b33713f48@mail.gmail.com> <48C90D37.1060201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <48C90D37.1060201@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Aagaard <aagaande@gmail.com>
Cc: Alexander Lyamin <flx@Msu.ru>, reiserfs-devel@vger.kernel.org

Anders Aagaard wrote:
> Alexander Lyamin wrote:
>> Why one have to worry about cleanness   of a  _journaled_ fs ?
>> Its seems like immediate return on -a is intended behavior.
>
> I suspect it is, I'm just making sure I have something to fire back
> with when a gentoo developer complains about my patch here:
>
> http://bugs.gentoo.org/show_bug.cgi?id=237393

Would you please maintain this issue in Gentoo? I was sure that reiser4
is not checked after every incorrect umount, whereas people shrink their
root partitions, format them with other file systems, etc.. and this is sad.

Thanks,
Edward.

>>
>> On Thu, Sep 11, 2008 at 3:26 PM, Anders Aagaard <aagaande@gmail.com
>> <mailto:aagaande@gmail.com>> wrote:
>>
>>     Hi
>>
>>     What's the correct options to pass to reiser4.fsck on boot to get it
>>     to check the filesystem when it's not marked as clean?
>>
>>     reiser4 fsck does implement -a, but it seems to return right away,
>>     including when the filesystem wasn't unmounted cleanly.  Is the
>>     filesystem integrity still secured by hash'es, so skipping fsck is
>>     intentional?
>>     --check --fix seems a tad bit excessive on every boot.
>>
>>     Anders Aagaard
>>
>>
>>
>> -- 
>> connecting the dots
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


