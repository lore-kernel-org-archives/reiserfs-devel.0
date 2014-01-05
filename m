From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Sun, 05 Jan 2014 19:47:16 +0000
Message-ID: <bug-29162-695-V7iQKjgbDD@https.bugzilla.kernel.org/>
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

--- Comment #57 from Ra=C3=BAl <rasasi78@gmail.com> ---
Created attachment 121041
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D121041&action=3De=
dit
dmesg for the oops (3.12.6)

I got this same hang on my laptop running Debian sid 3.12.6. Provided h=
ow
unrepeatable this bug is I can't tell if this is happenning more or les=
s often
than before Jeff's changes.

I have run the proposed torture tests (thanks D.K.), but I think short =
shoots
are not enough. I'll try overnight when I'm able to.
Regards,

--=20
You are receiving this mail because:
You are the assignee for the bug.--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
