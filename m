From: =?iso-8859-1?Q?Rasmus_B=F8g_Hansen?= <moffe@amagerkollegiet.dk>
Subject: Quota problem
Date: Fri, 10 May 2002 15:13:18 +0200 (CEST)
Message-ID: <Pine.LNX.4.44.0205101500340.1699-100000@grignard.amagerkollegiet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hi

I configured quotas on my reiserfs system about a half year ago. Now the=20
machine is running 2.4.18.

A few days ago, the electricity went away for a short time and forced a=20
hard reboot. The machine got up and running without problems - nearly.=20
Now I regularly get quota-related errors (se later).

I am a little unsure what to do; will quotacheck fix this? reiserfsck?=20
The partition is relatively small, so I could pretty easily back it up=20
and run various tests and fixes on it.

Before I begin, pehaps someone would like me to debug the file system; I=20
am willing to help find out what caused the error.

The machine is a standard PC with a VIA vt82c586b IDE controller and a=20
IBM-DTLA-307030 (with write-caching turned off).

Regards
/Rasmus

--=20
-- [ Rasmus "M=F8ffe" B=F8g Hansen ] ---------------------------------------
A computer without Windows, is like a fish without a bicycle.
----------------------------------[ moffe at amagerkollegiet dot dk ] --

May  6 12:39:03 carlsberg kernel: VFS: find_free_dqentry(): Data block full=
 but it shouldn't.
May  6 12:39:03 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  6 16:30:25 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  6 16:30:25 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  6 16:39:26 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  6 16:39:26 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  6 16:47:51 carlsberg kernel: VFS: Quota for id 704 referenced but not =
present.
May  6 16:47:51 carlsberg kernel: VFS: Can't read quota structure for id 70=
4.
May  6 19:21:46 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  6 19:21:46 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  6 19:40:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  6 19:40:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  6 19:44:25 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  6 19:44:25 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  6 22:26:01 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  6 22:26:01 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  6 22:43:24 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  6 22:43:24 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  6 23:56:11 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  6 23:56:11 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  7 00:08:03 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 00:08:03 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 02:00:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 02:00:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 05:22:45 carlsberg kernel: VFS: Quota for id 691 referenced but not =
present.
May  7 05:22:45 carlsberg kernel: VFS: Can't read quota structure for id 69=
1.
May  7 05:43:36 carlsberg kernel: VFS: Quota for id 696 referenced but not =
present.
May  7 05:43:36 carlsberg kernel: VFS: Can't read quota structure for id 69=
6.
May  7 05:53:19 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  7 05:53:19 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  7 06:02:18 carlsberg kernel: VFS: Quota for id 690 referenced but not =
present.
May  7 06:02:18 carlsberg kernel: VFS: Can't read quota structure for id 69=
0.
May  7 06:03:49 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 06:03:49 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 06:03:53 carlsberg kernel: VFS: Quota for id 693 referenced but not =
present.
May  7 06:03:53 carlsberg kernel: VFS: Can't read quota structure for id 69=
3.
May  7 06:22:30 carlsberg kernel: VFS: Quota for id 694 referenced but not =
present.
May  7 06:22:30 carlsberg kernel: VFS: Can't read quota structure for id 69=
4.
May  7 09:05:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 09:05:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 09:09:34 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 09:09:34 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 09:09:34 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 09:09:34 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 09:09:34 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 09:09:34 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 09:09:34 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 09:09:34 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 09:09:34 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 09:09:34 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 10:27:14 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  7 10:27:14 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  7 10:45:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 10:45:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 11:51:40 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  7 11:51:40 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  7 13:10:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 13:10:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 13:19:49 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 13:19:49 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 13:30:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 13:30:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 14:56:31 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May  7 14:56:31 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May  7 14:56:35 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 14:56:35 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 15:07:56 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 15:07:56 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 15:11:32 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 15:11:32 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 15:12:00 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May  7 15:12:00 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May  7 15:17:06 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 15:17:06 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 17:17:02 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 17:17:02 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 18:10:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 18:10:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 18:49:42 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 18:49:42 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 19:08:42 carlsberg kernel: VFS: Quota for id 696 referenced but not =
present.
May  7 19:08:42 carlsberg kernel: VFS: Can't read quota structure for id 69=
6.
May  7 19:17:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 19:17:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 19:48:14 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 19:48:14 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  7 20:52:38 carlsberg kernel: VFS: Quota for id 704 referenced but not =
present.
May  7 20:52:38 carlsberg kernel: VFS: Can't read quota structure for id 70=
4.
May  7 21:51:41 carlsberg kernel: VFS: Quota for id 696 referenced but not =
present.
May  7 21:51:41 carlsberg kernel: VFS: Can't read quota structure for id 69=
6.
May  7 22:06:46 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May  7 22:06:46 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May  7 22:22:59 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  7 22:22:59 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  7 22:34:36 carlsberg kernel: VFS: Quota for id 694 referenced but not =
present.
May  7 22:34:36 carlsberg kernel: VFS: Can't read quota structure for id 69=
4.
May  7 22:45:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  7 22:45:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  7 23:01:27 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  7 23:01:27 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  8 07:57:44 carlsberg kernel: VFS: Quota for id 700 referenced but not =
present.
May  8 07:57:44 carlsberg kernel: VFS: Can't read quota structure for id 70=
0.
May  8 08:34:18 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 08:34:18 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 10:25:44 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  8 10:25:44 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  8 11:02:42 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 11:02:42 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 12:29:29 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  8 12:29:29 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  8 12:45:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 12:45:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 13:06:45 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May  8 13:06:45 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May  8 13:20:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 13:20:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 13:23:53 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May  8 13:23:53 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May  8 13:24:39 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  8 13:24:39 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  8 13:32:47 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 13:32:47 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 14:35:34 carlsberg kernel: VFS: Quota for id 702 referenced but not =
present.
May  8 14:35:34 carlsberg kernel: VFS: Can't read quota structure for id 70=
2.
May  8 15:07:39 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 15:07:39 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 15:07:39 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 15:07:39 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 15:38:52 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  8 15:38:52 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  8 15:50:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 15:50:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 16:06:39 carlsberg kernel: VFS: Quota for id 704 referenced but not =
present.
May  8 16:06:39 carlsberg kernel: VFS: Can't read quota structure for id 70=
4.
May  8 16:50:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 16:50:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 18:46:51 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  8 18:46:51 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  8 18:48:52 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May  8 18:48:52 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May  8 19:09:25 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 19:09:25 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  8 21:34:21 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  8 21:34:21 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  8 22:28:03 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  8 22:28:03 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  9 00:28:46 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  9 00:28:46 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May  9 02:48:36 carlsberg kernel: VFS: Quota for id 702 referenced but not =
present.
May  9 02:48:36 carlsberg kernel: VFS: Can't read quota structure for id 70=
2.
May  9 05:22:51 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  9 05:22:51 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  9 09:05:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  9 09:05:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  9 09:37:34 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  9 09:37:34 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  9 11:26:35 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  9 11:26:35 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  9 11:40:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  9 11:40:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  9 12:32:43 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  9 12:32:43 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  9 12:55:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  9 12:55:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  9 14:21:23 carlsberg kernel: VFS: Quota for id 700 referenced but not =
present.
May  9 14:21:23 carlsberg kernel: VFS: Can't read quota structure for id 70=
0.
May  9 14:57:55 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May  9 14:57:55 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May  9 15:00:02 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May  9 15:00:02 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May  9 20:05:50 carlsberg kernel: VFS: Quota for id 692 referenced but not =
present.
May  9 20:05:50 carlsberg kernel: VFS: Can't read quota structure for id 69=
2.
May 10 00:05:00 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May 10 00:05:00 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May 10 06:43:17 carlsberg kernel: VFS: Quota for id 697 referenced but not =
present.
May 10 06:43:17 carlsberg kernel: VFS: Can't read quota structure for id 69=
7.
May 10 08:30:01 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May 10 08:30:01 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May 10 10:41:05 carlsberg kernel: VFS: Quota for id 700 referenced but not =
present.
May 10 10:41:05 carlsberg kernel: VFS: Can't read quota structure for id 70=
0.
May 10 10:57:52 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May 10 10:57:52 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May 10 11:35:00 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May 10 11:35:00 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May 10 12:08:30 carlsberg kernel: VFS: Quota for id 702 referenced but not =
present.
May 10 12:08:30 carlsberg kernel: VFS: Can't read quota structure for id 70=
2.
May 10 13:41:38 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May 10 13:41:38 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.
May 10 13:48:58 carlsberg kernel: VFS: Inserting already present quota entr=
y (block 13).
May 10 13:48:58 carlsberg kernel: VFS: Error -5 occured while creating quot=
a.
May 10 14:14:26 carlsberg kernel: VFS: Quota for id 688 referenced but not =
present.
May 10 14:14:26 carlsberg kernel: VFS: Can't read quota structure for id 68=
8.

