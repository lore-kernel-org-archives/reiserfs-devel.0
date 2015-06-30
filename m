From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [patch] reiser4: port for Linux-4.1
Date: Tue, 30 Jun 2015 09:30:59 +0200
Message-ID: <559245B3.1020804@gmail.com>
References: <558D5C72.2040203@gmail.com> <55918654.80703@gmail.com> <1435648387.15634.3.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=1eBoeJNZbcdnK+TgVEKpyXhAhX4PtMRjFswW14El+Ew=;
        b=pr1vUSZ5jXun2qjkXakJ8hy1JhzMJTYI28ToIxnP+U1tz+YQyoW7QyaCZlxHPIoGNB
         omYlvCe82HL2rzeWLTZiSs8px8aORNUx93uhUOEyW/BGNwZVoUI0w2fyWpjhhmT68P9G
         pOeWINgqMrPTKNLRSsWUtqbLDuaOUb0TnejKMQJb3BuQuXS3WzKNvyNaZ64rgg91J7/j
         0XNfdPt3M1ef9pcb4tKJfEWBALmKuaIY89fatD6bSo9sgCcleJeNq6XL32nJjDU3pV1E
         ALVPzRzxstKVTC+CRyH7OdICF8vbzmVHzPnhZo8hyGwGcW/ultnoqBVpKRxfYsRS7c/r
         s0fA==
In-Reply-To: <1435648387.15634.3.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>



On 06/30/2015 09:13 AM, Ivan Shapovalov wrote:
> On 2015-06-30 at 01:54 +0800, Edward Shishkin wrote:
>> Oh, bad
>> generic_write_checks() doesn't change offset now,
>> please, ignore this patch..
> Hi,

Hello.

>
> it does change it, but in struct kiocb instance, but we keep using
> initial "off".
>
> i'm trying to port file_operations' ->write() to ->write_iter() right


Hmm. You'll need to modify ->write() of both file plugins -
it's not simple, esp. for cryptcompress, which performs writes by
chunks (4, 8, ... 64K)

> now, FTR. The obvious fix (assign back ki_pos to off) is too ugly :)

may be just create a static inline function
reiser4_write_check() ?
{
     ...
     generic_write_check();
*off = iocb.ki_pos;
}

Thanks,
Edward.

