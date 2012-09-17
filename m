From: "dE ." <de.techno@gmail.com>
Subject: Re: linux 3.4.2 fails to compile with patch
Date: Mon, 17 Sep 2012 10:20:46 +0530
Message-ID: <5056AC26.2080608@gmail.com>
References: <5052B073.4080506@gmail.com> <1502246.NqeFiNrX3o@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=BUBg0aJdD13/H0A/EY7ExtthHCJ22ap+Jfb6FHeEtQ0=;
        b=J6irE/ExzXZmWAP2sEe/3pJsqc0YP7eBdx5m+x/QogQkSF1NrMOYjUJm2RiGYv7lST
         bj2yfzaWVKFUab0Ju/UMEuxr0VtqUdJdMPS3BwW2lrxZt/iByPNZ7aziuLBi0wJlaSrZ
         06i8nQVEvF9db40HIm4JrwHh67m8BEWLb/INyI9sCCxKCfjR6SFctqWfCl7DqXyV5ce+
         YAUtAelrqSY7oP2Z66k7nxXk5xH9bYEt0C8cXOcP26J42/ePmjtqTH7jbyjCFsSEMHjE
         TSi77ebsou62QbxBsuhjYY2mbtR8790Hmuq8PEyodA2zW4ZF1+ZvNkZee9pTqz83xntf
         v3ig==
In-Reply-To: <1502246.NqeFiNrX3o@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 09/14/12 18:12, Ivan Shapovalov wrote:
> On Friday 14 September 2012 09:50:03 dE . wrote:
>> Hello again :)
>>
>> I downloaded the recent patches for 3.2 to 3.5 kernels, and applied it
>> to my 3.4.2 kernel. It results in the following --
>>
>> CC      fs/fs-writeback.o
>> fs/fs-writeback.c: In function 'generic_writeback_sb_inodes':
>> fs/fs-writeback.c:560:6: error: request for member 'nr_to_write' in
>> something not a structure or union
>> fs/fs-writeback.c:561:6: error: request for member 'pages_skipped' in
>> something not a structure or union
>> fs/fs-writeback.c:563:3: warning: passing argument 3 of
>> 'writeback_single_inode' from incompatible pointer type [enabled by default]
>> fs/fs-writeback.c:344:1: note: expected 'struct writeback_control *' but
>> argument is of type 'struct writeback_control **'
>> fs/fs-writeback.c:565:38: error: request for member 'nr_to_write' in
>> something not a structure or union
>> fs/fs-writeback.c:566:29: error: request for member 'nr_to_write' in
>> something not a structure or union
>> fs/fs-writeback.c:569:10: error: request for member 'pages_skipped' in
>> something not a structure or union
>> make[1]: *** [fs/fs-writeback.o] Error 1
>> make: *** [fs] Error 2
> Hello,
>
> The vfs layer had undergone some changes between versions 3.4 and 3.5, so a
> patch against 3.5 won't work when applied to 3.4 or earlier versions.
> Instead, please, try the attached patch.
>
> Regards,
> Ivan Shapovalov.
>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Thankyou! It works. This should be added to the SF project.

I'll test reiser4 with my root partition (without compression).
