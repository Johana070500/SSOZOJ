#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define NUM_HILOS 3

// Estructura para pasar datos al hilo
struct datos_hilo {
    int id;
};

// Función que se ejecutará en cada hilo
void *funcion_hilo(void *arg) {
    struct datos_hilo *datos = (struct datos_hilo *)arg;

    // Imprimir mensaje de inicio
    printf("Hilo %d iniciado\n", datos->id);

    // Simular trabajo en el hilo
    sleep(3);

    // Imprimir mensaje de finalización
    printf("Hilo %d finalizado\n", datos->id);

    // Salir del hilo
    pthread_exit(NULL);
}

int main() {
    pthread_t hilos[NUM_HILOS];
    int i, resultado;

    // Crear e inicializar hilos
    for (i = 0; i < NUM_HILOS; i++) {
        struct datos_hilo *datos = malloc(sizeof(struct datos_hilo));
        if (datos == NULL) {
            perror("Error al asignar memoria para datos del hilo");
            exit(EXIT_FAILURE);
        }
        datos->id = i;

        resultado = pthread_create(&hilos[i], NULL, funcion_hilo, (void *)datos);
        if (resultado != 0) {
            fprintf(stderr, "Error al crear el hilo %d: %d\n", i, resultado);
            exit(EXIT_FAILURE);
        }
    }

    // Esperar a que todos los hilos terminen
    for (i = 0; i < NUM_HILOS; i++) {
        resultado = pthread_join(hilos[i], NULL);
        if (resultado != 0) {
            fprintf(stderr, "Error al esperar al hilo %d: %d\n", i, resultado);
            exit(EXIT_FAILURE);
        }
    }

    // Imprimir mensaje de finalización del programa
    printf("Todos los hilos han terminado\n");

    return 0;
}
