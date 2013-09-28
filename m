From: Evgeniy <iron.udjin@gmail.com>
Subject: reiser4_unlink_common [nikita-3398]: WARNING: Cannot unlink 2246037 (-2)
Date: Sat, 28 Sep 2013 22:31:14 +0300
Message-ID: <CAL2jS+kyd-2g0YJqm_BWLQuD52NuAxjv9eUS-ZGsbct6otLMGA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=T/+rAaQNBpcSpt4V1+nvcElnSZZA9u2ezU8ryU3FRt0=;
        b=AcnEVVmUsdAGRjJgktJ30vWgDnXaWfDh9IAfcS6ZXphD8WJrPNdjXy7cGkgbor8fog
         Ox73fWOdigcRSWMXpEHrjM7pmAcqozpmoNVHbptQA/QtZEII3gCKeK1ToAbtmrO0qjMj
         5/22zHqqVOqDv5Q/qtTVOp1gi4A9WCZQWNRd9y5mQaV+ZDd3kzcPDOSZl98dDfWBIkMa
         mcq/7Q57worx0MJUjxHJhr8GupFQeClM/1NFdtBmiY3s+DT/29xlicH+IcChKqJ5vXg7
         4ttXMP2YrUkbcNdwKT8IFsRNGHSgea01CCcROhW3OeIDOOGypA9glRGntGEoQV7ESzBQ
         WnUA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello Edward,

I can reproduce the problem with undeletable folders on my server. I
have two partitions. One of them xfs and the second is reiser4. When I
use rsync to copy Magento cache folder from xfs partition to reiser4
and trying to delete it tells me:
rm: cannot remove =E2=80=98mage--c=E2=80=99: Directory not empty
rm: cannot remove =E2=80=98mage--d=E2=80=99: Directory not empty
When I do the same copy by cp or mc - all is fine.

I hope this information somehow help you to catch the bug. If you need
any additional info - let me know.

Thanks
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
