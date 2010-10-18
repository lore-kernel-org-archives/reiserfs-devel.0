From: Viji V Nair <viji@fedoraproject.org>
Subject: reiser4 compile issue
Date: Mon, 18 Oct 2010 17:55:21 +0530
Message-ID: <AANLkTimJiCRhvAYqK=sdonHSjf9exh_yqhJo+aLJkhvT@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:sender:received:date
         :x-google-sender-auth:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=yDCT3WXDJBgDOSz0KJ180JDskqtqN3ZB9PJAei/wugk=;
        b=ImsGfJ3MJf7cmKugbVzx6w/lPqFmrIZn0RyIuuaONnJlLhzBCTqcRgsaU/kQIBA4Qa
         2hAvoSWO3rSL8j68qksSSLayns8mDdVkSJixSk+Xh2DYfDUOSh8RDChhVh2oIZlAI/ed
         sZfke6syqslwHv0xU1vN/UXe7VCL+B7C9GPmg=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi,

I am getting the following warning when I compile resier4 for 2.6.34.
The module is getting compiled anyway, can I ignore this?

make CONFIG_REISER4_FS=3Dm CONFIG_REISER4_DEBUG=3Dn M=3Dfs/reiser4

fs/reiser4/plugin/node/node40.c: In function =91create_item_node40=92:
fs/reiser4/plugin/node/node40.c:852: warning: ignoring return value of
=91__copy_from_user=92, declared with attribute warn_unused_result

Thanks
Viji
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
