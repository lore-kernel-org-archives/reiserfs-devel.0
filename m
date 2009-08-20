From: =?UTF-8?B?7ZmN7IugIHNoaW4gaG9uZw==?= <hongshin@gmail.com>
Subject: a question on lock ordering in write_ordered_buffers()
Date: Thu, 20 Aug 2009 16:55:26 +0900
Message-ID: <2014bcab0908200055w10aa616h2c779c3b5690b792@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=DViNg6T51xH7Kn/oXKbC8gt2zns1KJ1FJVogBf7NcDc=;
        b=h8RdHjWlcZ8YJLNrPOWUOoX9aowk6rxHVA/wrVzqZwrywFtdt6SSWw9rGwrp1jMf/r
         VOjIvnk+bzCos8EdBjyqwVQSnMtePqdGTCMxGFq8fMaS86P+OLRvq3nb05adhR1JnWzK
         LH+w7W32AzYg110bWVmAJtswiOa24TOXCvAaQ=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel@vger.kernel.org

Hi. I have a question on lock ordering
while I read ReiserFS code in Linux 2.6.30.4.

At write_ordered_buffers() function in reiserfs/journal.c,

What is the lock ordering between spin_lock(lock) and lock_buffer(bh)?

It seems that the lock ordering between spin_lock(lock) and
lock_buffer(bh) is inconsistent.
At line 858, the lock ordering is spin_lock(lock) =E2=86=92 lock_buffer=
(bh).
However, at line 881, lock_buffer(bh) =E2=86=92 spin_lock(lock)  since =
add_to_chunk()
releases and re-takes spin_lock(lock).

Is it necessary that the ordering between two locks is consistent?

Sincerely
Shin Hong
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
