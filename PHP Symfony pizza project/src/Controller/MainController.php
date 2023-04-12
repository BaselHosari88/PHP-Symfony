<?php

namespace App\Controller;
use App\Entity\Category;
use App\Entity\Order;
use App\Entity\Product;
use App\Form\PizzaType;
use App\Repository\CategoryRepository;
use App\Repository\OrderRepository;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MainController extends AbstractController
{
    #[Route('/', name: 'app_main')]
    public function index( CategoryRepository $categoryRepository): Response
    {
        $categories = $categoryRepository->findAll();
        return $this->render('main/index.html.twig', [

            'categories'=>$categories
        ]);
    }
    
    #[Route('/product/{id}', name: 'app_product')]
    public function product( ProductRepository $productRepository, Category $category): Response
    {


        $pizzas= $productRepository->findby(['category'=>$category]);


        return $this->render('main/product.html.twig', [

            'pizzas'=> $pizzas,

        ]);
    }
    #[Route('/form/{id}', name: 'app_form')]
    public function new(Request $request, OrderRepository $orderRepository, Product $pizza): Response
    {
        $todo='todo';
        $task = new Order();
        $task-> setPizza($pizza);
        $task-> setStatus($todo);

        $orders = $orderRepository->findAll();

        $form = $this->createForm(PizzaType::class, $task);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $task = $form->getData();

            $orderRepository->save($task);

            return $this->redirectToRoute('app_show');
        }

        return $this->renderForm('main/form.html.twig', [
            'form' => $form,
            'orders'=>$orders

        ]);
    }


    #[Route('/contact', name: 'app_contact')]
    public function contact( ): Response
    {

        return $this->render('main/contact.html.twig', [


        ]);
    }

    #[Route('/show', name: 'app_show')]
    public function show(OrderRepository $orderRepository): Response
    {
        $orders = $orderRepository->findAll();




        return $this->render('main/show.html.twig', [
            'orders'=> $orders
        ]);

    }


    #[Route('/update/{id}', name: 'app_update')]
    public function update(Request $request, OrderRepository $orderRepository, Order $order): Response
    {



        $task = $order;


        $orders = $orderRepository->findAll();

        $form = $this->createForm(PizzaType::class, $task);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $task = $form->getData();

            $orderRepository->save($task);

            return $this->redirectToRoute('app_show');
        }

        return $this->renderForm('main/form.html.twig', [
            'form' => $form,
            'orders'=>$orders

        ]);
    }

    #[Route('/delete/{id}', name: 'app_delete')]
    public function delete(OrderRepository $orderRepository,Order $order): Response
    {
        $delete = $order;
        $orderRepository->remove($delete);
        $orders = $orderRepository->findAll();




        return $this->render('main/show.html.twig', [
            'orders'=> $orders
        ]);

    }




}
