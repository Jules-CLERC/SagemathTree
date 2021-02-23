︠f449fd65-bc74-43b2-9bdb-05dabba79abds︠
def ModifierUneValeurDeLaMatrice(matrice, ligne, colonne, nouvelleValeur):
    matriceModification = matrix(RR,matrice.nrows(),matrice.ncols(),{(ligne,colonne): nouvelleValeur})
    return matrice + matriceModification

def ModifierLigneDeLaMatrice(matrice,ligne, nouvellesValeurs):
    for i in [0..len(nouvellesValeurs)-1]:
        matrice = ModifierUneValeurDeLaMatrice(matrice, ligne, i, nouvellesValeurs[i])
    return matrice

def AdditionnerUneColonneDeLaMatrice(matrice,colonne,valeur):
    matriceTransition = ModifierUneValeurDeLaMatrice(matrix.identity(3),2,colonne,valeur)
    return matrice * matriceTransition

#animation des feuilles---------------------------------------------------------------------------------------------------------------------------------------------

def fonteBouleNeige(frame):
    if (frame > 300):
        return 0
    else :
        return (-30+(0.1*frame))/-50

def GrandissementFeuille(frame):
    if (frame > 330):
        return 0.1
    else:
        return (30-(0.1*frame))/-30

def h(x,nb):                                                                #fonction calcul de la chute des boules de neige
    fct = -(x/500)^2
    if (nb + fct < 0):
        return -nb
    else:
        return fct

def g(x):                                                                   #trajectoire soleil et lune
    return (-0.01)*x^(2)+7

def f(x,nb):                                                                #fonction calcul de la chute des feuilles
    fct = -(x/150)^2
    if (nb + fct < 0):
        return -nb
    else:
        return fct

def AfficherFlocon(X,Y,taille):
    xp = plot(circle((X,Y), taille, fill=True,edgecolor='grey', facecolor='grey'))
    return xp

def AfficherPoint (X,Y,couleur,taille,rotation):                            #fonction permettant d'afficher les feuilles
    if (couleur == 0):#marron
        xp = polygon([
                (X+cos(0+(rotation*pi/12))*taille,Y+sin(0+(rotation*pi/12))*taille),
                (X+cos((2*pi/3)+(rotation*pi/12))*taille,Y+sin((2*pi/3)+(rotation*pi/12))*taille),
                (X+cos((4*pi/3)+(rotation*pi/12))*taille,Y+sin((4*pi/3)+(rotation*pi/12))*taille)],
                    fill=True, thickness=4, color='brown')
        xp += polygon([
                (X+0.15+cos(0+(rotation*pi/12))*taille,Y+0.15+sin(0+(rotation*pi/12))*taille),
                (X+0.15+cos((2*pi/3)+(rotation*pi/12))*taille,Y+0.15+sin((2*pi/3)+(rotation*pi/12))*taille),
                (X+0.15+cos((4*pi/3)+(rotation*pi/12))*taille,Y+0.15+sin((4*pi/3)+(rotation*pi/12))*taille)],
                    fill=True, thickness=4, color='#AC5E4E')
        xp += polygon([
                (X+0.15+cos(0+(rotation*pi/12))*taille,Y-0.15+sin(0+(rotation*pi/12))*taille),
                (X+0.15+cos((2*pi/3)+(rotation*pi/12))*taille,Y-0.15+sin((2*pi/3)+(rotation*pi/12))*taille),
                (X+0.15+cos((4*pi/3)+(rotation*pi/12))*taille,Y-0.15+sin((4*pi/3)+(rotation*pi/12))*taille)],
                    fill=True, thickness=4, color='#A54531')
        xp += polygon([
                (X-0.15+cos(0+(rotation*pi/12))*taille,Y+0.15+sin(0+(rotation*pi/12))*taille),
                (X-0.15+cos((2*pi/3)+(rotation*pi/12))*taille,Y+0.15+sin((2*pi/3)+(rotation*pi/12))*taille),
                (X-0.15+cos((4*pi/3)+(rotation*pi/12))*taille,Y+0.15+sin((4*pi/3)+(rotation*pi/12))*taille)],
                    fill=True, thickness=4, color='#803C2E')
        xp += polygon([
                (X-0.15+cos(0+(rotation*pi/12))*taille,Y-0.15+sin(0+(rotation*pi/12))*taille),
                (X-0.15+cos((2*pi/3)+(rotation*pi/12))*taille,Y-0.15+sin((2*pi/3)+(rotation*pi/12))*taille),
                (X-0.15+cos((4*pi/3)+(rotation*pi/12))*taille,Y-0.15+sin((4*pi/3)+(rotation*pi/12))*taille)],
                    fill=True, thickness=4, color='#8C564A')
    elif (couleur == 1):#vert
        xp = polygon([
                (X+cos(0)*taille,Y+sin(0)*taille),
                (X+cos(2*pi/3)*taille,Y+sin(2*pi/3)*taille),
                (X+cos(4*pi/3)*taille,Y+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='green')
        xp += polygon([
                (X+0.15+cos(0)*taille,Y+0.15+sin(0)*taille),
                (X+0.15+cos(2*pi/3)*taille,Y+0.15+sin(2*pi/3)*taille),
                (X+0.15+cos(4*pi/3)*taille,Y+0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#688C4A')
        xp += polygon([
                (X+0.15+cos(0)*taille,Y-0.15+sin(0)*taille),
                (X+0.15+cos(2*pi/3)*taille,Y-0.15+sin(2*pi/3)*taille),
                (X+0.15+cos(4*pi/3)*taille,Y-0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#5B8E31')
        xp += polygon([
                (X-0.15+cos(0)*taille,Y+0.15+sin(0)*taille),
                (X-0.15+cos(2*pi/3)*taille,Y+0.15+sin(2*pi/3)*taille),
                (X-0.15+cos(4*pi/3)*taille,Y+0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#509D0F')
        xp += polygon([
                (X-0.15+cos(0)*taille,Y-0.15+sin(0)*taille),
                (X-0.15+cos(2*pi/3)*taille,Y-0.15+sin(2*pi/3)*taille),
                (X-0.15+cos(4*pi/3)*taille,Y-0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#6DCD1D')
    elif (couleur == 2):#marron / vert
        xp = polygon([
                (X+cos(0)*taille,Y+sin(0)*taille),
                (X+cos(2*pi/3)*taille,Y+sin(2*pi/3)*taille),
                (X+cos(4*pi/3)*taille,Y+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='green')
        xp += polygon([
                (X+0.15+cos(0)*taille,Y+0.15+sin(0)*taille),
                (X+0.15+cos(2*pi/3)*taille,Y+0.15+sin(2*pi/3)*taille),
                (X+0.15+cos(4*pi/3)*taille,Y+0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='brown')
        xp += polygon([
                (X+0.15+cos(0)*taille,Y-0.15+sin(0)*taille),
                (X+0.15+cos(2*pi/3)*taille,Y-0.15+sin(2*pi/3)*taille),
                (X+0.15+cos(4*pi/3)*taille,Y-0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#679342')
        xp += polygon([
                (X-0.15+cos(0)*taille,Y+0.15+sin(0)*taille),
                (X-0.15+cos(2*pi/3)*taille,Y+0.15+sin(2*pi/3)*taille),
                (X-0.15+cos(4*pi/3)*taille,Y+0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#679342')
        xp += polygon([
                (X-0.15+cos(0)*taille,Y-0.15+sin(0)*taille),
                (X-0.15+cos(2*pi/3)*taille,Y-0.15+sin(2*pi/3)*taille),
                (X-0.15+cos(4*pi/3)*taille,Y-0.15+sin(4*pi/3)*taille)],
                     fill=True, thickness=4, color='#8B6E2F')
    return xp

def AnimationObjet (M ,p):                                          #fonction permettant d'animer les objets
    ga = []
    saveFeuille = M
    longueurX = 6
    longueurY = 10
    min = 0
    max = 360
    vitesse = 1
    BouleNeige = matrix([[RR.random_element(-5,5) for j in [1..100]],[RR.random_element(10,15) for k in [1..100]]])
    for frame in srange(min,max,vitesse):           #nb frames
        xp = p
        for j in [1..M.nrows()-1]:         #nb points
            if (frame < 30):                #degradé vert vers marron
                xp += AfficherPoint(M[j][0],M[j][1],1,0.1,0)
            elif (frame < 50):              #feuille morte
                xp += AfficherPoint(M[j][0],M[j][1],2,0.1,0)
            elif (frame < 90):              #feuille morte qui tombe
                M = ModifierUneValeurDeLaMatrice(M,j,1,f(frame,M[j][1]))
                if (M[j][1] > 0):
                    M = ModifierUneValeurDeLaMatrice(M,j,0,cos(frame)/5)
                    xp += AfficherPoint(M[j][0],M[j][1],0,0.1,frame-50)
                else:
                    xp += AfficherPoint(M[j][0],M[j][1],0,0.1,0)
            elif (frame < 300):             #feuille s'envole
                M = ModifierUneValeurDeLaMatrice(M,j,0,(frame-90)/10+RR.random_element(0,0.1))
                M = ModifierUneValeurDeLaMatrice(M,j,1,-M[j][1]+exp((frame-90)/18)-1+RR.random_element(0,0.1))
                xp += AfficherPoint(M[j][0],M[j][1],0,0.1,0)
            else:                        #repousse des feuilles
                tailleFeuille = GrandissementFeuille(frame)
                xp += AfficherPoint(saveFeuille[j][0],saveFeuille[j][1],1,tailleFeuille,0)
        if (frame % 60 > 30):                         #soleil
            LuneSoleil = plot(circle((frame%60-38,g(frame%60-38)), 0.7, fill=True,edgecolor='#FFE12A', facecolor='#FFE12A'))
        else :                                       #lune
            LuneSoleil = plot(circle((frame%60-8, g(frame%60-8)), 0.7, fill=True, edgecolor='#6B8076', facecolor='#6B8076'))
        if (frame > 110): #winter is coming
            for j in [0..BouleNeige.ncols()-1]: #pour chaque boule de neige
                BouleNeige = ModifierUneValeurDeLaMatrice(BouleNeige,1,j,h(frame,BouleNeige[1][j]))
                if (BouleNeige[1][j] > 0):
                    BouleNeige = ModifierUneValeurDeLaMatrice(BouleNeige,0,j,RR.random_element(-0.1,0.1))
                if (frame > 250):
                    tailleBouleNeige = fonteBouleNeige(frame)
                    xp += AfficherFlocon(BouleNeige[0][j],BouleNeige[1][j],tailleBouleNeige)
                else:
                    xp += AfficherFlocon(BouleNeige[0][j],BouleNeige[1][j],0.1)
        ga.append(LuneSoleil+xp)
    animate(ga,xmin=-5, xmax=5, ymin=0,ymax=8 ,figsize=(4,5)).show(delay=6)
#---------------------------------------------------------------------------------------------------------------------------------------------animation des feuilles


#creation de l'arbre------------------------------------------------------------------------------------------------------------------------------------------------

def CreationTabDist(NbRepet, NbBranche):                                    #tableau des proportions des distances branches mères / branches filles
    Tab = ([1])
    for i in [1..NbRepet]:
        for j in [1..(NbBranche^i)]:
            Tab += ([2^i])
    return Tab

def CalculDist(NbRepet, DistDep, NbBranche, NbTour, Tab):                   #calcul des distances de chaque branche à partir de Tab
    Dist = DistDep / (NbBranche)^(Tab[NbTour]-1)
    return Dist

def somme(NbBranche, NbRepet):                                              #calcul du nombre de racine a tracer
    somme = 0
    for i in [0..(NbRepet-1)]:
        somme += NbBranche^(i)
    return somme

def tronc(DistDep, xDep, yDep) :                                            #afficher le tronc de l'abre
    return polygon([(xDep,yDep),(xDep,yDep+DistDep)],color="#6B531F",thickness=10)

def arbre (NbBranche, AnglBranche, NbRepet) :          #creation de l'abre
    DistDep = 2
    xDep = 0
    yDep = 0
    NbRep = somme(NbBranche, NbRepet)    #calcul du nombre de racine a tracer
    p = tronc(DistDep, xDep, yDep)       #afficher le tronc de l'arbre
    AngleDep = (pi-(((NbBranche)-1)*AnglBranche))/2
    Tab = CreationTabDist(NbRepet, NbBranche)
    M = matrix(RR,len(Tab),5)
    tmp = ([xDep, yDep+DistDep, 1, xDep, yDep])
    M = ModifierLigneDeLaMatrice(M,0,tmp)
    positionLigne = 0
    for i in [0..NbRep-1]:
        xMere = M[i][0]
        yMere = M[i][1]
        xMereMere = M[i][3]
        yMereMere = M[i][4]
        AngleBrancheDep = arccos((xMere-xMereMere)/(sqrt(((xMere-xMereMere)^2)+(yMere-yMereMere)^2)))
        if (yMere - yMereMere < 0):
            AngleBrancheDep = -AngleBrancheDep
        AngleR = AngleBrancheDep-(pi/2)+AngleDep
        for j in [0..NbBranche-1]:
            Dist = DistDep / Tab[i]
            x1= xMere + (Dist * cos(AngleR+j*AnglBranche))
            y1 = yMere + (Dist * sin(AngleR+j*AnglBranche))
            p += polygon([(xMere,yMere),(x1,y1)],color="#6B531F",thickness=8/sqrt(Tab[i]))                 #afficher branche
            tmp = ([x1, y1, 1, xMere, yMere])
            positionLigne += 1
            M = ModifierLigneDeLaMatrice(M,positionLigne,tmp)
    AnimationObjet(M.delete_columns([3,4]) ,p)  #on supprime les colonnes xMereMere et yMereMere
#------------------------------------------------------------------------------------------------------------------------------------------------creation de l'arbre


#main----------------------------------------------------------------------------------------------------------------------------------------------------------------

NbBranche = 2
AnglBranche = pi/4
NbRepet = 2

arbre(NbBranche,AnglBranche, NbRepet)

#-----
︡cb757331-6b16-4516-be99-f907bf3cb98c︡{"file":{"filename":"/home/user/.sage/temp/project-d18ef7b6-b41a-4ece-a907-ac46adc13d60/555/tmp_IkQih7.webm","show":true,"text":null,"url":"/d18ef7b6-b41a-4ece-a907-ac46adc13d60/raw/.sage/temp/project-d18ef7b6-b41a-4ece-a907-ac46adc13d60/555/tmp_IkQih7.webm"},"once":false}︡{"done":true}









