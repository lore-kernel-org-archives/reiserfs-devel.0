From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sat, 11 May 2013 15:51:02 +0000 (UTC)
Message-ID: <20130511155102.2943411FA6B@bugzilla.kernel.org>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29162





--- Comment #47 from Ra=C3=BAl <rasasi78@gmail.com>  2013-05-11 15:51:0=
0 ---
I think rebuild-tree is more comprehensive than an usual --check or
--fix-fixable and therefore is able to find (and fix) hidden (yet usabl=
e)
problems.

Regarding definte repair, I wouldn't know yet. Lock could trigger after=
 5' or
maybe after months, depeding on my usage pattern. I'll report back if t=
he lock
happens or after a reasonable time.
Regards,

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
