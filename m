From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 29162] Reiserfs hang with dataloss sometimes
Date: Mon, 06 Jan 2014 16:07:42 +0000
Message-ID: <bug-29162-695-eVYGPRZXRH@https.bugzilla.kernel.org/>
References: <bug-29162-695@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <bug-29162-695@https.bugzilla.kernel.org/>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-devel@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D29162

--- Comment #60 from Jeff Mahoney <jeffm@suse.com> ---
(In reply to Ra=C3=BAl from comment #57)
> Created attachment 121041 [details]
> dmesg for the oops (3.12.6)
>=20
> I got this same hang on my laptop running Debian sid 3.12.6. Provided=
 how
> unrepeatable this bug is I can't tell if this is happenning more or l=
ess
> often than before Jeff's changes.
>=20
> I have run the proposed torture tests (thanks D.K.), but I think shor=
t
> shoots are not enough. I'll try overnight when I'm able to.


Thanks. The trace shows that we:

1) Have threads queued up on i_mutex
2) Have threads queued up on queue_log_writer holding i_mutex
3) Have a thread queued up on queue_log_writer holding i_mutex and the =
page
lock
4) Have a thread queued up on the page lock

Now to figure out what is causing the queue_log_writer condition to not
continue.

--=20
You are receiving this mail because:
You are the assignee for the bug.--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
